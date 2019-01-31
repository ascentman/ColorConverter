//
//  BegaRGBtoHSVTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaRGBtoHSVTests: XCTestCase {
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testRGBtoHSVmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 120.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 120.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 240.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 240.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 0.0)
        XCTAssertEqual(round(hsv.v * 100), 0.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testRGBtoHSVmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 0.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 327.0)
        XCTAssertEqual(round(hsv.s * 100), 92.0)
        XCTAssertEqual(round(hsv.v * 100), 47.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 327.0)
        XCTAssertEqual(result.s, 92.0)
        XCTAssertEqual(result.v, 47.0)
    }
    
    func testRGBtoHSVrandRGBCustomInit() {
        let matrix = ColorMatrix3(redx: 0.8015, redy: 0.2261, redBrightness: 0.698407376,
                                  greenx: 0.1160, greeny: 0.1243, greenBrightness: 0.88021794,
                                  bluex: 0.2417, bluey: 0.129, blueBrightness: 0.94357083)
        let bega = BEGAStandardRGBGamutColorModel(userColorMatrix: matrix)
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        bega.redByte = UInt8(r)
        bega.greenByte = UInt8(g)
        bega.blueByte = UInt8(b)
        _cie = bega.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 327.0)
        XCTAssertEqual(round(hsv.s * 100), 92.0)
        XCTAssertEqual(round(hsv.v * 100), 47.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 327.0)
        XCTAssertEqual(result.s, 92.0)
        XCTAssertEqual(result.v, 47.0)
    }
}
