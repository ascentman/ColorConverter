//
//  GenericXyYtoHSVTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericXyYtoHSVTests: XCTestCase {
    
    func testXyYtoHSVminXyY() {
        let x = 0.0
        let y = 0.0
        let Y = 0.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testXyYtoHSVmaxXyY() {
        let x = 1.0
        let y = 1.0
        let Y = 1.0
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testXyYtoHSVrandXyY() {
        let x = 0.15
        let y = 0.25
        let Y = 0.25
    
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.h, 204.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 25.0)
    }
    
    func testXyYtoHSVrand2XyY() {
        let x = 0.5
        let y = 0.5
        let Y = 0.5
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.h, 32.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 50.0)
    }
    
    func testXyYtoHSVrand3XyY() {
        let x = 0.1
        let y = 0.5
        let Y = 0.9
        
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: x, y: y, Y: Y)
        XCTAssertEqual(result.h, 143.0)
        XCTAssertEqual(result.s, 100.0)
        XCTAssertEqual(result.v, 90.0)

    }
    
    func testXyYtoHSVrand4XyY() {
        let cie = CIEXYZColor(-0.1, -0.2, -0.6)
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: cie.x, y: cie.y, Y: cie.relativeBrightness)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testXyYtoHSVrand5XyY() {
        let cie = CIEXYZColor(0.5, 2.5, 0.5)
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: cie.x, y: cie.y, Y: cie.relativeBrightness)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }
    
    func testXyYtoHSVInvalidXyY() {
        let cie = CIEXYZColor(0.5, 2.5, 0.5)
        let result = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: cie.x, y: cie.y, Y: cie.relativeBrightness)
        XCTAssertEqual(result.h, 0.0)
        XCTAssertEqual(result.s, 0.0)
        XCTAssertEqual(result.v, 0.0)
    }

}
