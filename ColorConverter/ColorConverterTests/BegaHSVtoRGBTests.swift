//
//  BegaHSVtoRGBTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaHSVtoRGBTests: XCTestCase {
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testHSVtoRGBminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 0.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testHSVtoRGBmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 255.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 0.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 0.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.r, 255.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testHSVtoRGBrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _begaRGB)
        
        XCTAssertEqual(Double(_begaRGB.redByte), 207.0)
        XCTAssertEqual(Double(_begaRGB.greenByte), 191.0)
        XCTAssertEqual(Double(_begaRGB.blueByte), 114.0)
        
        let result = ColorConverter.convertToRGB(colorModelType: _begaRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.r, 207.0)
        XCTAssertEqual(result.g, 191.0)
        XCTAssertEqual(result.b, 114.0)
    }
}
