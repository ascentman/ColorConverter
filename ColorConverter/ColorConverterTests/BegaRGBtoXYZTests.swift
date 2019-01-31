//
//  BegaRGBtoXYZTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaRGBtoXYZTests: XCTestCase {
    var _begaRGB: BEGAStandardRGBGamutColorModel!
    var _cie: CIEXYZColor!
    
    override func setUp() {
        _begaRGB = BEGAStandardRGBGamutColorModel()
    }
    
    override func tearDown() {
        _cie = nil
        _begaRGB = nil
    }
    
    func testRGBtoXYZmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.413)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1758)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0002)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.413)
        XCTAssertEqual(result.y, 0.1758)
        XCTAssertEqual(result.z, 0.0002)
    }
    
    func testRGBtoXYZmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.0754)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.3052)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0407)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.0754)
        XCTAssertEqual(result.y, 0.3052)
        XCTAssertEqual(result.z, 0.0407)
    }
    
    func testRGBtoXYZmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()

        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.1479)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1081)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.9591)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.1479)
        XCTAssertEqual(result.y, 0.1081)
        XCTAssertEqual(result.z, 0.9591)
    }
    
    func testRGBtoXYZminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.0)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.0)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testRGBtoXYZmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.6363)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.5891)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 1.0)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.6363)
        XCTAssertEqual(result.y, 0.5891)
        XCTAssertEqual(result.z, 1.0)
    }
    
    func testRGBtoXYZrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        _begaRGB.redByte = UInt8(r)
        _begaRGB.greenByte = UInt8(g)
        _begaRGB.blueByte = UInt8(b)
        _cie = _begaRGB.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.2379)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.1244)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.265)
        
        let result = ColorConverter.convertToXYZ(colorModelType: _begaRGB, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.2379)
        XCTAssertEqual(result.y, 0.1244)
        XCTAssertEqual(result.z, 0.265)
    }
    
    func testRGBtoXYZrandRGBCustomInit() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        let matrix = ColorMatrix3(redx: 0.1012, redy: 0.4285, redBrightness: 0.568407376,
                                  greenx: 0.5890, greeny: 0.3543, greenBrightness: 0.348021794,
                                  bluex: 0.2317, bluey: 0.5089, blueBrightness: 0.58357083)
        let bega = BEGAStandardRGBGamutColorModel(userColorMatrix: matrix)
        
        bega.redByte = UInt8(r)
        bega.greenByte = UInt8(g)
        bega.blueByte = UInt8(b)
        _cie = bega.toCIEXYZ()
        
        XCTAssertEqual((10000 * _cie.x).rounded() / 10000, 0.1059)
        XCTAssertEqual((10000 * _cie.y).rounded() / 10000, 0.2942)
        XCTAssertEqual((10000 * _cie.z).rounded() / 10000, 0.2516)
        
        let result = ColorConverter.convertToXYZ(colorModelType: bega, r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.1059)
        XCTAssertEqual(result.y, 0.2942)
        XCTAssertEqual(result.z, 0.2516)
    }
}
