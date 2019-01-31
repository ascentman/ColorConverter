//
//  GenericXyYtoRGBTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericXyYtoRGBTests: XCTestCase {

    func testXyYtoRGBminXyY() {
        let x = 0.0
        let y = 0.0
        let Y = 0.0
        
        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testXyYtoRGBmaxXyY() {
        let x = 1.0
        let y = 1.0
        let Y = 1.0

        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testXyYtoRGBrandXyY() {
        let x = 0.15
        let y = 0.25
        let Y = 0.25
        
        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 38.0)
        XCTAssertEqual(result.b, 64.0)
    }
    
    func testXyYtoRGBrand2XyY() {
        let x = 0.5
        let y = 0.5
        let Y = 0.5
        
        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 128.0)
        XCTAssertEqual(result.g, 68.0)
        XCTAssertEqual(result.b, 0.0)
    }
    
    func testXyYtoRGBInvalidXyY() {
        let x = 2.5
        let y = 0.5
        let Y = 0.5
   
        let result = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.r, 0.0)
        XCTAssertEqual(result.g, 0.0)
        XCTAssertEqual(result.b, 0.0)
    }
}
