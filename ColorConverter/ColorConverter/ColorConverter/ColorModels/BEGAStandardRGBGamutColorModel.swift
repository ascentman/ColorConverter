//
//  BEGAStandardRGBGamutColorModel.swift
//  BegaColorConverter
//
//  Created by Vova on 1/3/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import Foundation

final class BEGAStandardRGBGamutColorModel: GenericRGBColorModel {
    
    private let sysG = RGBSystemGenerator()
    
    override init() {
        super.init()
        _ = sysG.generateByxyBrightness(0.7012, 0.2985, 0.298407376,
                                        0.1790, 0.7243, 0.518021794,
                                        0.1217, 0.089, 0.18357083)
        _primaryRed = sysG.primaryRed
        _primaryGreen = sysG.primaryGreen
        _primaryBlue = sysG.primaryBlue
    }
    
    override init(userColorMatrix: ColorMatrix3) {
        super.init(userColorMatrix: userColorMatrix)
    }
}
