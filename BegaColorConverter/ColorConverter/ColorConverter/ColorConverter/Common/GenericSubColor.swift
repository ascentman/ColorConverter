//
//  GenericSubColor.swift
//  BegaColorConverter
//
//  Created by Vova on 12/26/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

public class GenericSubColor {
    
    func fromCIEXYZ(color: CIEXYZColor) {
        fatalError("must be overriden")
    }
    
    func toCIEXYZ(color: CIEXYZColor) {
        fatalError("must be overriden")
    }
    
    func toCIEXYZ() -> CIEXYZColor {
        let c = CIEXYZColor()
        toCIEXYZ(color: c)
        return c
    }
}
