//
//  GenericHSVtoXYZTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericHSVtoXYZTests: XCTestCase {
    var _sRGB: GenericRGBColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _sRGB = GenericRGBColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _sRGB = nil
    }
    
    func testHSVtoXYZminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)

        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.3787)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1953)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0178)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3787)
        XCTAssertEqual(result.y, 0.1953)
        XCTAssertEqual(result.z, 0.0178)
    }
    
    func testHSVtoRGBrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.6275)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.6801)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.4866)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.6275)
        XCTAssertEqual(result.y, 0.6801)
        XCTAssertEqual(result.z, 0.4866)
    }
    
    func testHSVtoRGBrand2HSV() {
        let h = 420.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.6481)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.7213)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.4935)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }

    func testHSVtoRGBrand3HSV() {
        let h = 482.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.5119)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.6508)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.4972)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBrand4HSV() {
        let h = 545.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.5601)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.6536)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.8019)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBrand5HSV() {
        let h = 601.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.4521)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.4355)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.7654)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBrand6HSV() {
        let h = 667.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.5816)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.5031)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.7342)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBInvalidHSV() {
        let h = 728.0
        let s = 45.0
        let v = 81.0
        
        let hsv = HSV(h: h, s: s / 100, v: v / 100)
        HsvConverter.toColor(item: hsv, colorModel: _sRGB)
        
        _cie = _sRGB.toCIEXYZ()
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.5438)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.5127)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.4587)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
}
