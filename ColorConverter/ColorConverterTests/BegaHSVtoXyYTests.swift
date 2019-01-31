//
//  BegaHSVtoXyYTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaHSVtoXyYTests: XCTestCase {
    
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testHSVtoXyYminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        _cie = _begaRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3333)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.3333)
        XCTAssertEqual((10000 * _begaRGB.relativeBrightness).rounded() / 10000, 0.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3333)
        XCTAssertEqual(result.y, 0.3333)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
    
    func testHSVtoXyYmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        _cie = _begaRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.7012)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.2985)
        XCTAssertEqual((10000 * _begaRGB.relativeBrightness).rounded() / 10000, 1.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.7012)
        XCTAssertEqual(result.y, 0.2985)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testHSVtoXyYrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        _cie = _begaRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3425)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.3139)
        XCTAssertEqual((10000 * _begaRGB.relativeBrightness).rounded() / 10000, 0.8118)
        
        let result = ColorConverter.convertToXyY(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3425)
        XCTAssertEqual(result.y, 0.3139)
        XCTAssertEqual(result.relativeBrightness, 0.8118)
    }
}
