//
//  GenericRGBtoXyYTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest


final class GenericRGBtoXyYTests: XCTestCase {

    func testRGBtoXyYmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0

        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.64)
        XCTAssertEqual(result.y, 0.33)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3)
        XCTAssertEqual(result.y, 0.6)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.15)
        XCTAssertEqual(result.y, 0.06)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3333)
        XCTAssertEqual(result.y, 0.3333)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
    
    func testRGBtoXyYmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3127)
        XCTAssertEqual(result.y, 0.329)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3787)
        XCTAssertEqual(result.y, 0.2175)
        XCTAssertEqual(result.relativeBrightness, 0.4706)
    }
    
    func testRGBtoXyYInvalidRGB() {
        let r = 300.0
        let g = 10.0
        let b = 70.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
}
