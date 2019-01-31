//
//  ConvertFunctions.swift
//  BegaColorConverter
//
//  Created by Vova on 1/15/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import Foundation

protocol ColorConvertable: class {
    associatedtype ColorModelScheme
    static func convertToRGB(colorModelType: ColorModelScheme, x: Double, y: Double, Y: Double) -> (r: Double, g: Double, b: Double)
    static func convertToRGB(colorModelType: ColorModelScheme, h: Double, s: Double, v: Double) -> (r: Double, g: Double, b: Double)
    static func convertToXyY(colorModelType: ColorModelScheme, r: Double, g: Double, b: Double) -> (x: Double, y: Double, relativeBrightness: Double)
    static func convertToXyY(colorModelType: ColorModelScheme, h: Double, s: Double, v: Double) -> (x: Double, y: Double, relativeBrightness: Double)
    static func convertToXYZ(colorModelType: ColorModelScheme, r: Double, g: Double, b: Double) -> (x: Double, y: Double, z: Double)
    static func convertToXYZ(colorModelType: ColorModelScheme, h: Double, s: Double, v: Double) -> (x: Double, y: Double, z: Double)
    static func convertToHSV(colorModelType: ColorModelScheme, r: Double, g: Double, b: Double) -> (h: Double, s: Double, v: Double)
    static func convertToHSV(colorModelType: ColorModelScheme, x: Double, y: Double, Y: Double) -> (h: Double, s: Double, v: Double)
    static func convertToXyY(cct: Double) -> (x: Double, y: Double)
}

final class ColorConverter: ColorConvertable {
    
    typealias ColorModelScheme = GenericRGBColorModel
    
    static func convertToRGB(colorModelType: ColorModelScheme, x: Double, y: Double, Y: Double) -> (r: Double, g: Double, b: Double) {
        var calculatedValues = (r: 0.0, g: 0.0, b: 0.0)
        if x < 0 || x > 1.0 || y < 0 || y > 1.0 || Y < 0 || Y > 1.0 {
            return calculatedValues
        }
        let cie = CIEXYZColor()
        cie.setByxyY(x, y, 0.5)
        colorModelType.fromCIEXYZ(color: cie)
        colorModelType.setRelativeBrightness(b: Y)
        calculatedValues.r = Double(colorModelType.redByte)
        calculatedValues.g = Double(colorModelType.greenByte)
        calculatedValues.b = Double(colorModelType.blueByte)
        return calculatedValues
    }
    
    static func convertToRGB(colorModelType: ColorModelScheme, h: Double, s: Double, v: Double) -> (r: Double, g: Double, b: Double) {
        var calculatedValues = (r: 0.0, g: 0.0, b: 0.0)
        if h < 0 || h > 360 || s < 0 || s > 100 || v < 0 || v > 100 {
            return calculatedValues
        }
        let hsv = HSV(h: h, s: s / 100 , v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: colorModelType)
        calculatedValues.r = Double(colorModelType.redByte)
        calculatedValues.g = Double(colorModelType.greenByte)
        calculatedValues.b = Double(colorModelType.blueByte)
        return calculatedValues
    }
    
    static func convertToXyY(colorModelType: ColorModelScheme, r: Double, g: Double, b: Double) -> (x: Double, y: Double, relativeBrightness: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, relativeBrightness: 0.0)
        if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 {
            return calculatedValues
        }
        colorModelType.redByte = UInt8(r)
        colorModelType.greenByte = UInt8(g)
        colorModelType.blueByte = UInt8(b)
        
        let cie = colorModelType.toCIEXYZ()
        calculatedValues.x = (10000 * cie.colorX).rounded() / 10000
        calculatedValues.y = (10000 * cie.colorY).rounded() / 10000
        calculatedValues.relativeBrightness = (10000 * colorModelType.relativeBrightness).rounded() / 10000
        return calculatedValues
    }
    
    static func convertToXyY(colorModelType: ColorModelScheme, h: Double, s: Double, v: Double) -> (x: Double, y: Double, relativeBrightness: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, relativeBrightness: 0.0)
        if h < 0 || h > 360 || s < 0 || s > 100 || v < 0 || v > 100 {
            return calculatedValues
        }
        let hsv = HSV(h: h, s: s / 100 , v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: colorModelType)
        let cie = colorModelType.toCIEXYZ()
        calculatedValues.x = (cie.colorX * 10000).rounded() / 10000
        calculatedValues.y = (cie.colorY * 10000).rounded() / 10000
        calculatedValues.relativeBrightness = (colorModelType.relativeBrightness * 10000).rounded() / 10000
        return calculatedValues
    }
    
    static func convertToHSV(colorModelType: ColorModelScheme, r: Double, g: Double, b: Double) -> (h: Double, s: Double, v: Double) {
        var calculatedValues = (h: 0.0, s: 0.0, v: 0.0)
        if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 {
            return calculatedValues
        }
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        calculatedValues.h = round(hsv.h)
        calculatedValues.s = round(hsv.s * 100)
        calculatedValues.v = round(hsv.v * 100)
        return calculatedValues
    }
    
    static func convertToHSV(colorModelType: ColorModelScheme, x: Double, y: Double, Y: Double) -> (h: Double, s: Double, v: Double) {
        var calculatedValues = (h: 0.0, s: 0.0, v: 0.0)
        if x < 0 || x > 1.0 || y < 0 || y > 1.0 || Y < 0 || Y > 1.0 {
            return calculatedValues
        }
        let cie = CIEXYZColor()
        cie.setByxyY(x, y, 0.5)
        colorModelType.fromCIEXYZ(color: cie)
        colorModelType.setRelativeBrightness(b: Y)
        let hsv = HsvConverter.toColorSpace(r: Double(colorModelType.redByte) / 255.0, g: Double(colorModelType.greenByte) / 255.0, b: Double(colorModelType.blueByte) / 255.0)
        calculatedValues.h = round(hsv.h)
        calculatedValues.s = round(hsv.s * 100)
        calculatedValues.v = round(hsv.v * 100)
        return calculatedValues
    }
    
    static func convertToXYZ(colorModelType: ColorModelScheme, r: Double, g: Double, b: Double) -> (x: Double, y: Double, z: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, z: 0.0)
        if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 {
            return calculatedValues
        }
        colorModelType.redByte = UInt8(r)
        colorModelType.greenByte = UInt8(g)
        colorModelType.blueByte = UInt8(b)
        
        let cie = colorModelType.toCIEXYZ()
        calculatedValues.x = (cie.x * 10000).rounded() / 10000
        calculatedValues.y = (cie.y * 10000).rounded() / 10000
        calculatedValues.z = (cie.z * 10000).rounded() / 10000
        return calculatedValues
    }
    
    static func convertToXYZ(colorModelType: ColorModelScheme, h: Double, s: Double, v: Double) -> (x: Double, y: Double, z: Double) {
        var calculatedValues = (x: 0.0, y: 0.0, z: 0.0)
        if h < 0 || h > 360 || s < 0 || s > 100 || v < 0 || v > 100 {
            return calculatedValues
        }
        let hsv = HSV(h: h, s: s / 100 , v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: colorModelType)
        let cie = colorModelType.toCIEXYZ()
        calculatedValues.x = (cie.x * 10000).rounded() / 10000
        calculatedValues.y = (cie.y * 10000).rounded() / 10000
        calculatedValues.z = (cie.z * 10000).rounded() / 10000
        return calculatedValues
    }
    
    static func convertToXyY(cct: Double) -> (x: Double, y: Double) {
        if cct < 2000 || cct > 10000 {
            return (0,0)
        }
        let cctx = (CctToxy.calculateCctColorX(cct) * 10000).rounded() / 10000
        let ccty = (CctToxy.calculateCctColorY(cct, x: cctx) * 10000).rounded() / 10000
        return (cctx, ccty)
    }
}
