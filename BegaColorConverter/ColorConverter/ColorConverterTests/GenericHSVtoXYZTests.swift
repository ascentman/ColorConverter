//
//  GenericHSVtoXYZTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/11/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class GenericHSVtoXYZTests: XCTestCase {
    
    func testHSVtoXYZminHSV() {
        let h = 0.0
        let s = 0.0
        let v = 0.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBmaxHSV() {
        let h = 360.0
        let s = 100.0
        let v = 100.0
 
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.3787)
        XCTAssertEqual(result.y, 0.1953)
        XCTAssertEqual(result.z, 0.0178)
    }
    
    func testHSVtoRGBrandHSV() {
        let h = 50.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.6275)
        XCTAssertEqual(result.y, 0.6801)
        XCTAssertEqual(result.z, 0.4866)
    }
    
    func testHSVtoRGBrand2HSV() {
        let h = 420.0
        let s = 45.0
        let v = 81.0
    
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }

    func testHSVtoRGBrand3HSV() {
        let h = 482.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBrand4HSV() {
        let h = 545.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBrand5HSV() {
        let h = 601.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBrand6HSV() {
        let h = 667.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
    
    func testHSVtoRGBInvalidHSV() {
        let h = 728.0
        let s = 45.0
        let v = 81.0
        
        let result = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
        XCTAssertEqual(result.z, 0.0)
    }
}
