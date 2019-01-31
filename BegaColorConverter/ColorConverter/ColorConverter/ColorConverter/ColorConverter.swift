//
//  ConvertFunctions.swift
//  BegaColorConverter
//
//  Created by Vova on 1/15/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import Foundation

public enum ColorInput {
    
    case predefined(ColorModel)
    case userDefined(GenericRGBColorModel)
    
    fileprivate var model: GenericRGBColorModel {
        get {
            let model: GenericRGBColorModel
            switch self {
            case .predefined(.rgb):
                model = GenericRGBColorModel()
            case .predefined(.begasRGB):
                model = BEGAStandardRGBGamutColorModel()
            case .userDefined(let inputModel):
                model = inputModel
            }
            return model
        }
    }
}

public protocol ColorConvertable: class {
    static func convertToRGB(colorModelType: ColorInput, x: Double, y: Double, Y: Double) -> (r: Double, g: Double, b: Double)
    static func convertToRGB(colorModelType: ColorInput, h: Double, s: Double, v: Double) -> (r: Double, g: Double, b: Double)
    static func convertToXyY(colorModelType: ColorInput, r: Double, g: Double, b: Double) -> (x: Double, y: Double, relativeBrightness: Double)
    static func convertToXyY(colorModelType: ColorInput, h: Double, s: Double, v: Double) -> (x: Double, y: Double, relativeBrightness: Double)
    static func convertToXYZ(colorModelType: ColorInput, r: Double, g: Double, b: Double) -> (x: Double, y: Double, z: Double)
    static func convertToXYZ(colorModelType: ColorInput, h: Double, s: Double, v: Double) -> (x: Double, y: Double, z: Double)
    static func convertToHSV(colorModelType: ColorInput, r: Double, g: Double, b: Double) -> (h: Double, s: Double, v: Double)
    static func convertToHSV(colorModelType: ColorInput, x: Double, y: Double, Y: Double) -> (h: Double, s: Double, v: Double)
    static func convertToXyY(cct: Double) -> (x: Double, y: Double)
}

final public class ColorConverter: ColorConvertable {

    public static func convertToRGB(colorModelType: ColorInput, x: Double, y: Double, Y: Double) -> (r: Double, g: Double, b: Double) {
        var calculatedValues = (r: 0.0, g: 0.0, b: 0.0)
        if x < 0 || x > 1.0 || y < 0 || y > 1.0 || Y < 0 || Y > 1.0 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        let cie = CIEXYZColor()
        cie.setByxyY(x, y, 0.5)
        model.fromCIEXYZ(color: cie)
        model.setRelativeBrightness(b: Y)

        calculatedValues.r = Double(model.redByte)
        calculatedValues.g = Double(model.greenByte)
        calculatedValues.b = Double(model.blueByte)
        return calculatedValues
    }


    public static func convertToRGB(colorModelType: ColorInput, h: Double, s: Double, v: Double) -> (r: Double, g: Double, b: Double) {
        var calculatedValues = (r: 0.0, g: 0.0, b: 0.0)
        if h < 0 || h > 360 || s < 0 || s > 100 || v < 0 || v > 100 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        let hsv = HSV(h: h, s: s / 100 , v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: model)
        calculatedValues.r = Double(model.redByte)
        calculatedValues.g = Double(model.greenByte)
        calculatedValues.b = Double(model.blueByte)
        return calculatedValues
    }

    public static func convertToXyY(colorModelType: ColorInput, r: Double, g: Double, b: Double) -> (x: Double, y: Double, relativeBrightness: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, relativeBrightness: 0.0)
        if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        model.redByte = UInt8(r)
        model.greenByte = UInt8(g)
        model.blueByte = UInt8(b)

        let cie = model.toCIEXYZ()
        calculatedValues.x = (10000 * cie.colorX).rounded() / 10000
        calculatedValues.y = (10000 * cie.colorY).rounded() / 10000
        calculatedValues.relativeBrightness = (10000 * model.relativeBrightness).rounded() / 10000
        return calculatedValues
    }

    public static func convertToXyY(colorModelType: ColorInput, h: Double, s: Double, v: Double) -> (x: Double, y: Double, relativeBrightness: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, relativeBrightness: 0.0)
        if h < 0 || h > 360 || s < 0 || s > 100 || v < 0 || v > 100 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        let hsv = HSV(h: h, s: s / 100 , v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: model)
        let cie = model.toCIEXYZ()
        calculatedValues.x = (cie.colorX * 10000).rounded() / 10000
        calculatedValues.y = (cie.colorY * 10000).rounded() / 10000
        calculatedValues.relativeBrightness = (model.relativeBrightness * 10000).rounded() / 10000
        return calculatedValues
    }

    public static func convertToHSV(colorModelType: ColorInput, r: Double, g: Double, b: Double) -> (h: Double, s: Double, v: Double) {
        var calculatedValues = (h: 0.0, s: 0.0, v: 0.0)
        if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 {
            return calculatedValues
        }
        let _: GenericRGBColorModel = colorModelType.model
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        calculatedValues.h = round(hsv.h)
        calculatedValues.s = round(hsv.s * 100)
        calculatedValues.v = round(hsv.v * 100)
        return calculatedValues
    }

    public static func convertToHSV(colorModelType: ColorInput, x: Double, y: Double, Y: Double) -> (h: Double, s: Double, v: Double) {
        var calculatedValues = (h: 0.0, s: 0.0, v: 0.0)
        if x < 0 || x > 1.0 || y < 0 || y > 1.0 || Y < 0 || Y > 1.0 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        let cie = CIEXYZColor()
        cie.setByxyY(x, y, 0.5)
        model.fromCIEXYZ(color: cie)
        model.setRelativeBrightness(b: Y)
        let hsv = HsvConverter.toColorSpace(r: Double(model.redByte) / 255.0, g: Double(model.greenByte) / 255.0, b: Double(model.blueByte) / 255.0)
        calculatedValues.h = round(hsv.h)
        calculatedValues.s = round(hsv.s * 100)
        calculatedValues.v = round(hsv.v * 100)
        return calculatedValues
    }

    public static func convertToXYZ(colorModelType: ColorInput, r: Double, g: Double, b: Double) -> (x: Double, y: Double, z: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, z: 0.0)
        if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        model.redByte = UInt8(r)
        model.greenByte = UInt8(g)
        model.blueByte = UInt8(b)

        let cie = model.toCIEXYZ()
        calculatedValues.x = (cie.x * 10000).rounded() / 10000
        calculatedValues.y = (cie.y * 10000).rounded() / 10000
        calculatedValues.z = (cie.z * 10000).rounded() / 10000
        return calculatedValues
    }

    public static func convertToXYZ(colorModelType: ColorInput, h: Double, s: Double, v: Double) -> (x: Double, y: Double, z: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, z: 0.0)
        if h < 0 || h > 360 || s < 0 || s > 100 || v < 0 || v > 100 {
            return calculatedValues
        }
        let model: GenericRGBColorModel = colorModelType.model
        let hsv = HSV(h: h, s: s / 100 , v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: model)
        let cie = model.toCIEXYZ()
        calculatedValues.x = (cie.x * 10000).rounded() / 10000
        calculatedValues.y = (cie.y * 10000).rounded() / 10000
        calculatedValues.z = (cie.z * 10000).rounded() / 10000
        return calculatedValues
    }

    public static func convertToXyY(cct: Double) -> (x: Double, y: Double) {
        if cct < 2000 || cct > 10000 {
            return (0,0)
        }
        let cctx = (CctToxy.calculateCctColorX(cct) * 10000).rounded() / 10000
        let ccty = (CctToxy.calculateCctColorY(cct, x: cctx) * 10000).rounded() / 10000
        return (cctx, ccty)
    }
}
