//
//  GenericRGBColorModel.swift
//  BegaColorConverter
//
//  Created by Vova on 12/27/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

struct ColorMatrix3 {
    let redx: Double
    let redy: Double
    let redBrightness: Double
    let greenx: Double
    let greeny: Double
    let greenBrightness: Double
    let bluex: Double
    let bluey: Double
    let blueBrightness: Double
}

class GenericRGBColorModel: GenericSubColor {
    
    private var _compandingType = CompandingTypes.linear
    private var _gamma = 2.2
    private var _linearRed: Double = 1.0
    private var _linearGreen: Double = 1.0
    private var _linearBlue: Double = 1.0
    
    var _primaryRed: CIEXYZColor
    var _primaryGreen: CIEXYZColor
    var _primaryBlue: CIEXYZColor
    
    override init() {
        let sysG = RGBSystemGenerator()
        let _ = sysG.generateByxyBrightness(0.6400, 0.3300, 0.212656,
                                            0.3000, 0.6000, 0.715158,
                                            0.1500, 0.0600, 0.072186)
        _primaryRed = sysG.primaryRed
        _primaryGreen = sysG.primaryGreen
        _primaryBlue = sysG.primaryBlue
    }
    
    init(userColorMatrix: ColorMatrix3) {
        
        let sysG = RGBSystemGenerator()
        _ = sysG.generateByxyBrightness(userColorMatrix.redx, userColorMatrix.redy, userColorMatrix.redBrightness,
                                        userColorMatrix.greenx, userColorMatrix.greeny, userColorMatrix.greenBrightness,
                                        userColorMatrix.bluex, userColorMatrix.bluey, userColorMatrix.blueBrightness)
        _primaryRed = sysG.primaryRed
        _primaryGreen = sysG.primaryGreen
        _primaryBlue = sysG.primaryBlue
    }
    
    init(primaryRed: CIEXYZColor, primaryGreen: CIEXYZColor, primaryBlue: CIEXYZColor) {
        _primaryRed = primaryRed
        _primaryGreen = primaryGreen
        _primaryBlue = primaryBlue
    }
    
    var red: Double {
        get {
            return compand(value: _linearRed)
        }
        set {
            _linearRed = inversCompand(value: newValue)
        }
    }
    
    var green: Double {
        get {
            return compand(value: _linearGreen)
        }
        set {
            _linearGreen = inversCompand(value: newValue)
        }
    }
    
    var blue: Double {
        get {
            return compand(value: _linearBlue)
        }
        set {
            _linearBlue = inversCompand(value: newValue)
        }
    }
    
    var linearRed: Double {
        get {
            return _linearRed
        }
        set {
            _linearRed = newValue
        }
    }
    
    var linearGreen: Double {
        get {
            return _linearGreen
        }
        set {
            _linearGreen = newValue
        }
    }
    
    var linearBlue: Double {
        get {
            return _linearBlue
        }
        set {
            _linearBlue = newValue
        }
    }
    
    var primaryRed: CIEXYZColor {
        get {
            return _primaryRed
        }
        set {
            _primaryRed = newValue
        }
    }
    
    var primaryGreen: CIEXYZColor {
        get {
            return _primaryGreen
        }
        set {
            _primaryGreen = newValue
        }
    }
    
    var primaryBlue: CIEXYZColor {
        get {
            return _primaryBlue
        }
        set {
            _primaryBlue = newValue
        }
    }
    
    var compandingTypes: CompandingTypes {
        get {
            return _compandingType
        }
        set {
            _compandingType = newValue
        }
    }
    
    var gamma: Double {
        get {
            return _gamma
        }
        set {
            _gamma = newValue
        }
    }
    
    var relativeBrightness: Double {
        get {
            return getRelativeBrightness()
        }
        set {
            setRelativeBrightness(b: newValue)
        }
    }
    
    var redByte: UInt8 {
        get {
            if red.isNaN {
                return 0
            }
            return UInt8(round(red * 255))
        }
        set {
            red = Double(newValue) / 255.0
        }
    }
    
    var greenByte: UInt8 {
        get {
            if green.isNaN {
                return 0
            }
            return UInt8(round(green * 255))
        }
        set {
            green = Double(newValue) / 255.0
        }
    }
    
    var blueByte: UInt8 {
        get {
            if blue.isNaN {
                return 0
            }
            return UInt8(round(blue * 255))
        }
        set {
            blue = Double(newValue) / 255.0
        }
    }
    
    override func fromCIEXYZ(color: CIEXYZColor) {
        var f = 1.0
        let denominator = ( _primaryBlue.x * (_primaryRed.y * _primaryGreen.z - _primaryGreen.y * _primaryRed.z) +
            _primaryGreen.x * (_primaryBlue.y * _primaryRed.z - _primaryRed.y * _primaryBlue.z) +
            _primaryRed.x * (_primaryGreen.y * _primaryBlue.z - _primaryBlue.y * _primaryGreen.z))
        
        if denominator != 0.0 {
            linearRed = -(_primaryBlue.x * (_primaryGreen.y * color.z - color.y * _primaryGreen.z) +
                color.x * (_primaryBlue.y * _primaryGreen.z - _primaryGreen.y * _primaryBlue.z) +
                _primaryGreen.x * (color.y * _primaryBlue.z - _primaryBlue.y * color.z)) / denominator
            linearGreen = (_primaryBlue.x * (_primaryRed.y * color.z - color.y * _primaryRed.z) +
                color.x * (_primaryBlue.y * _primaryRed.z - _primaryRed.y * _primaryBlue.z) +
                _primaryRed.x * (color.y * _primaryBlue.z - _primaryBlue.y * color.z)) / denominator
            linearBlue = (color.x * (_primaryRed.y * _primaryGreen.z - _primaryGreen.y * _primaryRed.z) +
                _primaryGreen.x * (color.y * _primaryRed.z - _primaryRed.y * color.z) +
                _primaryRed.x * (_primaryGreen.y * color.z - color.y * _primaryGreen.z)) / denominator
        }
        
        if linearRed > f {
            f = linearRed
        }
        if linearGreen > f {
            f = linearGreen
        }
        if linearBlue > f {
            f = linearBlue
        }
        linearRed = linearRed / f
        linearGreen = linearGreen / f
        linearBlue = linearBlue / f
        
        if linearRed < 0.0 {
            linearRed = 0.0
        }
        if linearGreen < 0.0 {
            linearGreen = 0.0
        }
        if linearBlue < 0.0 {
            linearBlue = 0.0
        }
    }
    
    override func toCIEXYZ(color: CIEXYZColor) {
        color.x = (linearRed * _primaryRed.x) + (linearGreen * _primaryGreen.x) + (linearBlue * _primaryBlue.x)
        color.y = (linearRed * _primaryRed.y) + (linearGreen * _primaryGreen.y) + (linearBlue * _primaryBlue.y)
        color.z = (linearRed * _primaryRed.z) + (linearGreen * _primaryGreen.z) + (linearBlue * _primaryBlue.z)
    }
    
    override func toCIEXYZ() -> CIEXYZColor {
        let ret = CIEXYZColor()
        toCIEXYZ(color: ret)
        return ret
    }
    
    func getRelativeBrightness() -> Double {
        return max(linearRed, max(linearGreen, linearBlue))
    }
    
    func setRelativeBrightness(b: Double) {
        let maxComponent = max(linearRed, max(linearGreen, linearBlue))
        linearRed = linearRed / maxComponent * b
        linearGreen = linearGreen / maxComponent * b
        linearBlue = linearBlue / maxComponent * b
    }
    
    func clone() -> GenericRGBColorModel {
        let returnModel = GenericRGBColorModel(primaryRed: primaryRed, primaryGreen: primaryGreen, primaryBlue: primaryBlue)
        returnModel.compandingTypes = compandingTypes
        return returnModel
    }
    
    func setByRGB(_ r: UInt8, _ g: UInt8, _ b: UInt8) {
        redByte = r
        greenByte = g
        blueByte = b
    }
    
    // MARK: - Private
    
    private func compand(value: Double) -> Double {
        switch compandingTypes {
        case .linear:
            return value
        case .gamma:
            return GammaCompanding.gammeCompanding(value, gamma)
        case .sRgb:
            return GammaCompanding.sRGBCompanding(value)
        case .l:
            return GammaCompanding.lCompanding(value)
        }
    }
    
    private func inversCompand(value: Double) -> Double {
        switch compandingTypes {
        case .linear:
            return value
        case .gamma:
            return GammaCompanding.inverseGammeCompanding(value, gamma)
        case .sRgb:
            return GammaCompanding.sRGBInverseCompanding(value)
        case .l:
            return GammaCompanding.lInverseCompanding(value)
        }
    }
}
