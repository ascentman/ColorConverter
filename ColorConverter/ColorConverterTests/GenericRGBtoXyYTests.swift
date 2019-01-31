//
//  GenericRGBtoXyYTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest


final class GenericRGBtoXyYTests: XCTestCase {
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
    
    func testRGBtoXyYmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual(_cie.colorX, 0.64)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.33)
        XCTAssertEqual(_sRGB.relativeBrightness, 1.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.64)
        XCTAssertEqual(result.y, 0.33)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual(_cie.colorX, 0.3)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.6)
        XCTAssertEqual(_sRGB.relativeBrightness, 1.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3)
        XCTAssertEqual(result.y, 0.6)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.15)
        XCTAssertEqual((1000 * _cie.colorY).rounded() / 1000, 0.06)
        XCTAssertEqual(_sRGB.relativeBrightness, 1.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.15)
        XCTAssertEqual(result.y, 0.06)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3333)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.3333)
        XCTAssertEqual(_sRGB.relativeBrightness, 0.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3333)
        XCTAssertEqual(result.y, 0.3333)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
    
    func testRGBtoXyYmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3127)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.329)
        XCTAssertEqual(_sRGB.relativeBrightness, 1.0)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3127)
        XCTAssertEqual(result.y, 0.329)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.colorX).rounded() / 10000, 0.3787)
        XCTAssertEqual((10000 * _cie.colorY).rounded() / 10000, 0.2175)
        XCTAssertEqual((10000 * _sRGB.relativeBrightness).rounded() / 10000, 0.4706)
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3787)
        XCTAssertEqual(result.y, 0.2175)
        XCTAssertEqual(result.relativeBrightness, 0.4706)
    }
    
    func testRGBtoXyYInvalidRGB() {
        let r = 300.0
        let g = 10.0
        let b = 70.0
        
        let result = ColorConverter.convertToXyY(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
}
