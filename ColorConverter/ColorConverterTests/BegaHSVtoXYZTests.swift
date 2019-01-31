//
//  BegaHSVtoXYZTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

import XCTest

final class BegaHSVtoXYZTests: XCTestCase {
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testHSVtoXYZminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        _cie = _begaRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoXYZmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
    
        _cie = _begaRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.413)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1758)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0002)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.413)
        XCTAssertEqual(result.y, 0.1758)
        XCTAssertEqual(result.z, 0.0002)
    }
    
    func testHSVtoXYZrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        _cie = _begaRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.4578)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.4196)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.4594)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.4578)
        XCTAssertEqual(result.y, 0.4196)
        XCTAssertEqual(result.z, 0.4594)
    }
}
