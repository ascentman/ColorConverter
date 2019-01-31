//
//  BegaXyYtoHSVTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaXyYtoHSVTests: XCTestCase {
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testXyYtoHSVminXyY() {
        let x = 0.0
        let y = 0.0
        let Y = 0.0
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        let hsv = HsvConverter.toColorSpace(r: Double(_begaRGB.redByte) / 255.0, g: Double(_begaRGB.greenByte) / 255.0, b: Double(_begaRGB.blueByte) / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 0.0)
        XCTAssertEqual(round(hsv.v * 100), 0.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, x: x, y: Y, Y: Y)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testXyYtoHSVmaxXyY() {
        let x = 1.0
        let y = 1.0
        let Y = 1.0
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        let hsv = HsvConverter.toColorSpace(r: Double(_begaRGB.redByte) / 255.0, g: Double(_begaRGB.greenByte) / 255.0, b: Double(_begaRGB.blueByte) / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 0.0)
        XCTAssertEqual(round(hsv.v * 100), 0.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, x: x, y: Y, Y: Y)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testXyYtoHSVrandXyY() {
        let x = 0.15
        let y = 0.25
        let Y = 0.25
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        let hsv = HsvConverter.toColorSpace(r: Double(_begaRGB.redByte) / 255.0, g: Double(_begaRGB.greenByte) / 255.0, b: Double(_begaRGB.blueByte) / 255.0)
        XCTAssertEqual(round(hsv.h), 182.0)
        XCTAssertEqual(round(hsv.s * 100), 94.0)
        XCTAssertEqual(round(hsv.v * 100), 25.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, x: x, y: Y, Y: Y)
        XCTAssertEqual(result.h, 182.0)
        XCTAssertEqual(result.s, 94.0)
        XCTAssertEqual(result.v, 25.0)
    }
    
    func testXyYtoHSVrand2XyY() {
        let x = 0.5
        let y = 0.5
        let Y = 0.5
        
        _cie = _begaRGB.toCIEXYZ()
        _cie.setByxyY(x, y, Y)
        _begaRGB.fromCIEXYZ(color: _cie)
        _begaRGB.setRelativeBrightness(b: Y)
        
        let hsv = HsvConverter.toColorSpace(r: Double(_begaRGB.redByte) / 255.0, g: Double(_begaRGB.greenByte) / 255.0, b: Double(_begaRGB.blueByte) / 255.0)
        XCTAssertEqual(round(hsv.h), 62.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 50.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, x: x, y: Y, Y: Y)
        XCTAssertEqual(result.h, 62.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 50.0)
    }
}
