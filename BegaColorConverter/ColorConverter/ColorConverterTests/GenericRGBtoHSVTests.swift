//
//  GenericRGBtoHSVTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericRGBtoHSVTests: XCTestCase {
    
    func testRGBtoHSVmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 120.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 240.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testRGBtoHSVmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 100.0)
    }
    
    func testRGBtoHSVrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 327.0)
        XCTAssertEqual(result.s, 92.0)
        XCTAssertEqual(result.v, 47.0)
    }
    
    func testRGBtoHSVInvalidRGB() {
        let r = 120.0
        let g = 10.0
        let b = 470.0

        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
}
