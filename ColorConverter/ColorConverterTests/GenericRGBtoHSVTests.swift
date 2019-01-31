//
//  GenericRGBtoHSVTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericRGBtoHSVTests: XCTestCase {

    var _sRGB: GenericRGBColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _sRGB = GenericRGBColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _sRGB = nil
    }
    
    func testRGBtoHSVmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 120.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 120.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 240.0)
        XCTAssertEqual(round(hsv.s * 100), 100.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 240.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 0.0)
        XCTAssertEqual(round(hsv.v * 100), 0.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testRGBtoHSVmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 0.0)
        XCTAssertEqual(round(hsv.s * 100), 0.0)
        XCTAssertEqual(round(hsv.v * 100), 100.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        let hsv = HsvConverter.toColorSpace(r: r / 255.0, g: g / 255.0, b: b / 255.0)
        XCTAssertEqual(round(hsv.h), 327.0)
        XCTAssertEqual(round(hsv.s * 100), 92.0)
        XCTAssertEqual(round(hsv.v * 100), 47.0)
        
        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 327.0)
        XCTAssertEqual(result.s, 92.0)
        XCTAssertEqual(result.v, 47.0)
    }
    
    func testRGBtoHSVInvalidRGB() {
        let r = 120.0
        let g = 10.0
        let b = 470.0

        let result = ColorConverter.convertToHSV(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
}
