//
//  GenericHSVtoRGBTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericHSVtoRGBTests: XCTestCase {
    
    func testHSVtoRGBminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0

        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testHSVtoRGBmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.begasRGB), h: h, s: s, v: v)
        XCTAssertEqual(result.r, 255.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testHSVtoRGBrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.begasRGB), h: h, s: s, v: v)
        XCTAssertEqual(result.r, 207.0)
        XCTAssertEqual(result.g, 191.0)
        XCTAssertEqual(result.b, 114.0)
    }
    
    func testHSVtoRGBInvalidHSV() {
        let h = 450.0
        let s = 45.0
        let v = 81.0

        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.begasRGB), h: h, s: s, v: v)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
}
