//
//  GenericHSVtoXyYTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericHSVtoXyYTests: XCTestCase {
    
    func testHSVtoXyYminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3333)
        XCTAssertEqual(result.y, 0.3333)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
    
    func testHSVtoXyYmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.64)
        XCTAssertEqual(result.y, 0.33)
        XCTAssertEqual(result.relativeBrightness, 1.0)
    }
    
    func testHSVtoXyYrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3497)
        XCTAssertEqual(result.y, 0.379)
        XCTAssertEqual(result.relativeBrightness, 0.8118)
    }
    
    func testHSVtoXyYInvalidHSV() {
        let h = 450.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.relativeBrightness, 0.0)
    }
}
