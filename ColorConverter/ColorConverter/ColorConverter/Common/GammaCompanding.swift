//
//  GammaCompanding.swift
//  BegaColorConverter
//
//  Created by Vova on 12/26/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

private enum Constants {
    static let epsilon = 216.0 / 24389.0
    static let kappa = 24389.0 / 27.0
    static let sRgbCompandingBarrier = 0.0031308
    static let sRgbInverseCompandingBarrier = 0.04045
}

final class GammaCompanding {
    
    class func gammeCompanding(_ value: Double, _ gamma: Double) -> Double {
        return pow(value, 1.0 / gamma)
    }
    
    class func inverseGammeCompanding(_ value: Double, _ gamma: Double) -> Double {
        return pow(value, gamma)
    }
    
    class func lCompanding(_ value: Double) -> Double {
        var returnValue = value
        if value <= Constants.epsilon {
            returnValue = returnValue * Constants.kappa / 100
        } else {
            returnValue = pow(1.16 * value, 1.0 / 3.0) - 0.16
        }
        return returnValue
    }
    
    class func lInverseCompanding(_ value: Double) -> Double {
        var returnValue = value
        if value <= 0.08 {
            returnValue = returnValue * 100 / Constants.kappa
        } else {
            returnValue = pow((value + 0.16) / 1.16, 3.0)
        }
        return returnValue
    }
    
    class func sRGBCompanding(_ value: Double) -> Double {
        var returnValue = value
        if value <= Constants.sRgbCompandingBarrier {
            returnValue *= 12.92
        } else {
            returnValue = (1.055 * pow(value, 1.0 / 2.4)) - 0.055
        }
        return returnValue
    }
    
    class func sRGBInverseCompanding(_ value: Double) -> Double {
        var returnValue = value
        if value <= Constants.sRgbInverseCompandingBarrier {
            returnValue /= 12.92
        } else {
            returnValue = pow((value + 0.055) / 1.055, 2.4)
        }
        return returnValue
    }
}
