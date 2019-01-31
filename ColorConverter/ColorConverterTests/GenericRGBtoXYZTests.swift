//
//  GenericRGBtoXYZTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericRGBtoXYZTests: XCTestCase {
    var _sRGB: GenericRGBColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _sRGB = GenericRGBColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _sRGB = nil
    }
    
    func testRGBtoXYZmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.3787)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1953)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0178)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3787)
        XCTAssertEqual(result.y, 0.1953)
        XCTAssertEqual(result.z, 0.0178)
    }
    
    func testRGBtoXYZmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.3284)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.6567)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.1095)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3284)
        XCTAssertEqual(result.y, 0.6567)
        XCTAssertEqual(result.z, 0.1095)
    }
    
    func testRGBtoXYZmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.1657)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.0663)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.8728)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.1657)
        XCTAssertEqual(result.y, 0.0663)
        XCTAssertEqual(result.z, 0.8728)
    }
    
    func testRGBtoXYZminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testRGBtoXYZmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()

        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.8728)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.9183)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 1.0)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.8728)
        XCTAssertEqual(result.y, 0.9183)
        XCTAssertEqual(result.z, 1.0)
    }
    
    func testRGBtoXYZrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        _sRGB.redByte = UInt8(r)
        _sRGB.greenByte = UInt8(g)
        _sRGB.blueByte = UInt8(b)
        _cie = _sRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.2366)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1358)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.2522)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.2366)
        XCTAssertEqual(result.y, 0.1358)
        XCTAssertEqual(result.z, 0.2522)
    }
    
    func testRGBtoXYZInvalidRGB() {
        let r = 120.0
        let g = 310.0
        let b = 70.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: _sRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
}
