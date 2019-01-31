//
//  GenericHSVtoXyYTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericHSVtoXyYTests: XCTestCase {
    var _sRGB: GenericRGBColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _sRGB = GenericRGBColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _sRGB = nil
    }
    
    func testHSVtoXyYminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3333)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.3333)
        XCTAssertEqual((10000 * _sRGB.relativeBrightness).rounded() / 10000, 0.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3333)
        XCTAssertEqual(result.y, 0.3333)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
    
    func testHSVtoXyYmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.64)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.33)
        XCTAssertEqual((10000 * _sRGB.relativeBrightness).rounded() / 10000, 1.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.64)
        XCTAssertEqual(result.y, 0.33)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testHSVtoXyYrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3497)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.379)
        XCTAssertEqual((10000 * _sRGB.relativeBrightness).rounded() / 10000, 0.8118)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3497)
        XCTAssertEqual(result.y, 0.379)
        XCTAssertEqual(result.relativeBrightness, 0.8118)
    }
    
    func testHSVtoXyYInvalidHSV() {
        let h = 450.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
}
