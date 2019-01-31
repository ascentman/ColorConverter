//
//  BegaColorConverterCCTTests.swift
//  BegaColorConverterTests
//
//  Created by Vova on 1/10/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import XCTest

final class BegaColorConverterCCTTests: XCTestCase {

    // MARK: - Test in range value
    
    func testCCTavgValue() {
        let cct = 5000.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(cctx, 0.3464)
        XCTAssertEqual(ccty, 0.3516)
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.3464)
        XCTAssertEqual(result.y, 0.3516)
    }
    
    // MARK: - Test extreme values
    
    func testCCTminValue() {
        let cct = 2000.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(cctx, 0.53)
        XCTAssertEqual(ccty, 0.4123)
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.53)
        XCTAssertEqual(result.y, 0.4123)
    }
    
    func testCCTmaxValue() {
        let cct = 10000.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(cctx, 0.2802)
        XCTAssertEqual(ccty, 0.2905)
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.2802)
        XCTAssertEqual(result.y, 0.2905)
    }
    
    // MARK: - Test under or over range
    
    func testCCTunderRange() {
        let cct = 1999.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(String(format: "%.15f", cctx), "0.527013764524301")
        XCTAssertEqual(String(format: "%.15f", ccty), "0.413247439597644")
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
    }
    
    func testCCTunderRange2() {
        let cct = 0.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(cctx, 0.333333)
        XCTAssertEqual(ccty, 0.333333)
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
    }
    
    func testCCToverRange() {
        let cct = 10001.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(String(format: "%.15f", cctx), "0.280692470104389")
        XCTAssertEqual(String(format: "%.15f", ccty), "0.288299088968080")
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
    }
    
    func testCCToverRange2() {
        let cct = 30000.0
        let cctx = CctToxy.calculateCctColorX(cct)
        let ccty = CctToxy.calculateCctColorY(cct, x: cctx)
        XCTAssertEqual(cctx, 0.333333)
        XCTAssertEqual(ccty, 0.333333)
        
        let result = ColorConverter.convertToXyY(cct: cct)
        XCTAssertEqual(result.x, 0.0)
        XCTAssertEqual(result.y, 0.0)
    }
}
