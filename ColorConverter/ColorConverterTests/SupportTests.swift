//
//  SupportTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/14/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest


final class SupportTests: XCTestCase {
    var _sRGB: GenericRGBColorModel!
    var _cie: CIEXYZColor!
    var _sRGBwithInit: GenericRGBColorModel!
    
    override func setUp() {
        _sRGB = GenericRGBColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _sRGB = nil
    }
    
    func testCustomColorModelInit() {
        let color1 = CIEXYZColor.init(0.5, 0.5, 0.5)
        let color2 = CIEXYZColor.init(0.1, 0.2, 0.8)
        let color3 = CIEXYZColor.init(0.18, 0.14, 0.12)
        _sRGBwithInit = GenericRGBColorModel(primaryRed: color1, primaryGreen: color2, primaryBlue: color3)
        _cie = _sRGBwithInit.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.2977)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.3206)
        XCTAssertEqual((10000 * _sRGB.relativeBrightness).rounded() / 10000, 1.0)
    }
    
    func testPrimaryColors() {
        let color1 = CIEXYZColor.init(0.5, 0.5, 0.5)
        let color2 = CIEXYZColor.init(0.1, 0.2, 0.8)
        let color3 = CIEXYZColor.init(0.18, 0.14, 0.12)
        _sRGBwithInit = GenericRGBColorModel()
        _sRGBwithInit.primaryRed = color1
        _sRGBwithInit.primaryGreen = color2
        _sRGBwithInit.primaryBlue = color3
        
        XCTAssertEqual(_sRGBwithInit.primaryRed.colorX, color1.colorX)
        XCTAssertEqual(_sRGBwithInit.primaryRed.colorY, color1.colorY)
        XCTAssertEqual(_sRGBwithInit.primaryRed.relativeBrightness, color1.relativeBrightness)
        XCTAssertEqual(_sRGBwithInit.primaryGreen.colorX, color2.colorX)
        XCTAssertEqual(_sRGBwithInit.primaryGreen.colorY, color2.colorY)
        XCTAssertEqual(_sRGBwithInit.primaryGreen.relativeBrightness, color2.relativeBrightness)
        XCTAssertEqual(_sRGBwithInit.primaryBlue.colorX, color3.colorX)
        XCTAssertEqual(_sRGBwithInit.primaryBlue.colorY, color3.colorY)
        XCTAssertEqual(_sRGBwithInit.primaryBlue.relativeBrightness, color3.relativeBrightness)
    }
    
    func testSetGetGamma() {
        _sRGB.gamma = 2.5
        XCTAssertEqual(_sRGB.gamma, 2.5)
    }
    
    func testSetGetRelativeBrightness() {
        _sRGB.relativeBrightness = 0.6
        XCTAssertEqual(_sRGB.relativeBrightness, 0.6)
    }
    
    func testCloneModel() {
        _sRGB.compandingTypes = .gamma
        let color1 = CIEXYZColor.init(0.5, 0.5, 0.5)
        let color2 = CIEXYZColor.init(0.1, 0.2, 0.8)
        let color3 = CIEXYZColor.init(0.18, 0.14, 0.12)
        _sRGB = GenericRGBColorModel()
        _sRGB.primaryRed = color1
        _sRGB.primaryGreen = color2
        _sRGB.primaryBlue = color3
        let testModel = _sRGB.clone()
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, testModel.compandingTypes.rawValue)
        XCTAssertEqual(_sRGB.primaryRed.colorX, testModel.primaryRed.colorX)
        XCTAssertEqual(_sRGB.primaryGreen.colorX, testModel.primaryGreen.colorX)
        XCTAssertEqual(_sRGB.primaryBlue.colorX, testModel.primaryBlue.colorX)
        XCTAssertEqual(_sRGB.primaryRed.colorY, testModel.primaryRed.colorY)
        XCTAssertEqual(_sRGB.primaryGreen.colorY, testModel.primaryGreen.colorY)
        XCTAssertEqual(_sRGB.primaryBlue.colorY, testModel.primaryBlue.colorY)
        XCTAssertEqual(_sRGB.primaryRed.relativeBrightness, testModel.primaryRed.relativeBrightness)
        XCTAssertEqual(_sRGB.primaryGreen.relativeBrightness, testModel.primaryGreen.relativeBrightness)
        XCTAssertEqual(_sRGB.primaryBlue.relativeBrightness, testModel.primaryBlue.relativeBrightness)
    }
    
    func testCompandingTypes() {
        _sRGB.compandingTypes = .gamma
        _sRGB.red = 100.0
        _sRGB.green = 10.0
        _sRGB.blue = 30.0
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, 2)
        XCTAssertEqual(round(_sRGB.red), 100.0)
        XCTAssertEqual(round(_sRGB.green), 10.0)
        XCTAssertEqual(round(_sRGB.blue), 30.0)
        
        _sRGB.compandingTypes = .sRgb
        _sRGB.red = 20.0
        _sRGB.green = 15.0
        _sRGB.blue = 34.0
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, 3)
        XCTAssertEqual(round(_sRGB.red), 20.0)
        XCTAssertEqual(round(_sRGB.green), 15.0)
        XCTAssertEqual(round(_sRGB.blue), 34.0)
        
        _sRGB.compandingTypes = .l
        _sRGB.red = 25.0
        _sRGB.green = 43.0
        _sRGB.blue = 38.0
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, 4)
        XCTAssertEqual(round(_sRGB.red), 23.0)
        XCTAssertEqual(round(_sRGB.green), 39.0)
        XCTAssertEqual(round(_sRGB.blue), 34.0)
    }
    
    func testCompandingTypes2() {
        _sRGB.compandingTypes = .gamma
        _sRGB.red = 0.00055
        _sRGB.green = 0.0022
        _sRGB.blue = 0.00124
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, 2)
        XCTAssertEqual(round(_sRGB.red), 0.0)
        XCTAssertEqual(round(_sRGB.green), 0.0)
        XCTAssertEqual(round(_sRGB.blue), 0.0)
        
        _sRGB.compandingTypes = .sRgb
        _sRGB.red = 0.00055
        _sRGB.green = 0.0022
        _sRGB.blue = 0.000124
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, 3)
        XCTAssertEqual(round(_sRGB.red), 0.0)
        XCTAssertEqual(round(_sRGB.green), 0.0)
        XCTAssertEqual(round(_sRGB.blue), 0.0)
        
        _sRGB.compandingTypes = .l
        _sRGB.red = 0.00055
        _sRGB.green = 0.0022
        _sRGB.blue = 0.00124
        
        XCTAssertEqual(_sRGB.compandingTypes.rawValue, 4)
        XCTAssertEqual(round(_sRGB.red), 0.0)
        XCTAssertEqual(round(_sRGB.green), 0.0)
        XCTAssertEqual(round(_sRGB.blue), 0.0)
    }
    
    func testCieColorMaxBoundaries() {
        _cie = CIEXYZColor()
        _cie.x = 1.2
        _cie.y = 1.1
        _cie.z = 2.0
        
        XCTAssertEqual(_cie.a, _cie.x)
        XCTAssertEqual(_cie.b, _cie.y)
        XCTAssertEqual(_cie.c, _cie.z)
    }
    
    func testCieColorMinBoundaries() {
        _cie = CIEXYZColor()
        _cie.x = -0.4
        _cie.y = -0.1
        _cie.z = -1.0
        
        XCTAssertEqual(_cie.a, _cie.x)
        XCTAssertEqual(_cie.b, _cie.y)
        XCTAssertEqual(_cie.c, _cie.z)
        XCTAssertEqual(_cie.length, 0.0)
    }
    
    func testCieSetGetABC() {
        _cie = CIEXYZColor()
        _cie.a = 0.5
        _cie.b = 0.4
        _cie.c = 0.1
        
        XCTAssertEqual(_cie.a, 0.5)
        XCTAssertEqual(_cie.b, 0.4)
        XCTAssertEqual(_cie.c, 0.1)
    }
    
    func testCieScalingBrightness() {
        _cie = CIEXYZColor()
        _cie.x = 0.4
        _cie.y = 0.8
        _cie.c = 0.9
        let factor = _cie.getMaxScalingFactor()
        _cie.scaleToBrightness(2.0)
        
        XCTAssertEqual(factor, 0.9)
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.8889)
        XCTAssertEqual(_cie.y, 1.0)
        XCTAssertEqual(_cie.z, 1.0)
    }
    
    func testCieScalingBrightness2() {
        _cie = CIEXYZColor()
        _cie.x = 0.4
        _cie.y = 0.8
        _cie.z = 0.2
        _cie.scaleToBrightness(-0.5)
        
        XCTAssertEqual(_cie.x, 0.0)
        XCTAssertEqual(_cie.y, 0.0)
        XCTAssertEqual(_cie.z, 0.0)
    }
    
    func testCieRelativeBrightness() {
        _cie = CIEXYZColor()
        _cie.x = 0.3
        _cie.y = 0.1
        _cie.z = 0.2
        _cie.setByxyAndRelativeBrightness(0.3, 0.1, 2.0)
        
        XCTAssertEqual(_cie.x, 0.5)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1667)
        XCTAssertEqual(_cie.z, 1.0)
    }
    
    func testCieRelativeBrightness2() {
        _cie = CIEXYZColor()
        _cie.x = 0.3
        _cie.y = 0.1
        _cie.z = 0.2
        _cie.setByxyAndRelativeBrightness(0.3, 0.1, -0.5)
        
        XCTAssertEqual(_cie.x, 0.0)
        XCTAssertEqual(_cie.y, 0.0)
        XCTAssertEqual(_cie.z, 0.0)
    }
}
