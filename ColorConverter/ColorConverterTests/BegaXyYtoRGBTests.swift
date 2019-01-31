//
//  BegaXyYtoRGBTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaXyYtoRGBTests: XCTestCase {
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testXyYtoRGBminXyY() {
        let x = 0.0
        let y = 0.0
        let Y = 0.0
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 0.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testXyYtoRGBmaxXyY() {
        let x = 1.0
        let y = 1.0
        let Y = 1.0
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 0.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testXyYtoRGBrandXyY() {
        let x = 0.15
        let y = 0.25
        let Y = 0.25
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 4.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 62.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 64.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 4.0)
        XCTAssertEqual(result.g, 62.0)
        XCTAssertEqual(result.b, 64.0)
    }
    
    func testXyYtoRGBrand2XyY() {
        let x = 0.5
        let y = 0.5
        let Y = 0.5
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 124.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 128.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 0.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 124.0)
        XCTAssertEqual(result.g, 128.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testXyYtoRGBInvalidValues() {
        let x = -0.5
        let y = 0.0
        let Y = 0.0
    
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
}
