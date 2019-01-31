//
//  BegaRGBtoXyYTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaRGBtoXyYTests: XCTestCase {
    
    func testRGBtoXyYmaxR() {
        let r = 255.0
        let g = 0.0
        let b = 0.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.7012)
        XCTAssertEqual(result.y, 0.2985)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYmaxG() {
        let r = 0.0
        let g = 255.0
        let b = 0.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.179)
        XCTAssertEqual(result.y, 0.7243)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYmaxB() {
        let r = 0.0
        let g = 0.0
        let b = 255.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.1217)
        XCTAssertEqual(result.y, 0.089)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYminRGB() {
        let r = 0.0
        let g = 0.0
        let b = 0.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3333)
        XCTAssertEqual(result.y, 0.3333)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
    
    func testRGBtoXyYmaxRGB() {
        let r = 255.0
        let g = 255.0
        let b = 255.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.2859)
        XCTAssertEqual(result.y, 0.2647)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testRGBtoXyYrandRGB() {
        let r = 120.0
        let g = 10.0
        let b = 70.0
    
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: r, g: g, b: b)
        XCTAssertEqual(result.x, 0.3793)
        XCTAssertEqual(result.y, 0.1983)
        XCTAssertEqual(result.relativeBrightness, 0.4706)
    }
}
