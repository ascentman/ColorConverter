//
//  RGBSystemGenerator.swift
//  BegaColorConverter
//
//  Created by Vova on 12/27/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

final class RGBSystemGenerator {
    
    var primaryRed: CIEXYZColor!
    var primaryGreen: CIEXYZColor!
    var primaryBlue: CIEXYZColor!
    
    func generateByXYZ(_ redX: Double, _ redY: Double, _ redZ: Double,
                       _ greenX: Double, _ greenY: Double, _ greenZ: Double,
                       _ blueX: Double, _ blueY: Double, _ blueZ: Double) -> Bool {
        
        primaryRed = CIEXYZColor()
        primaryGreen = CIEXYZColor()
        primaryBlue = CIEXYZColor()
        
        let sX = redX + greenX + blueX
        let sY = redY + greenY + blueY
        let sZ = redZ + greenZ + blueZ
        let maxCompSum = max(sX, max(sY, sZ))
        
        primaryRed.x = redX / maxCompSum
        primaryRed.y = redY / maxCompSum
        primaryRed.z = redZ / maxCompSum
        
        primaryGreen.x = greenX / maxCompSum
        primaryGreen.y = greenY / maxCompSum
        primaryGreen.z = greenZ / maxCompSum
        
        primaryBlue.x = blueX / maxCompSum
        primaryBlue.y = blueY / maxCompSum
        primaryBlue.z = blueZ / maxCompSum
        return true
    }
    
    func generateByxyBrightness(_ redx: Double, _ redy: Double, _ redBrightness: Double,
                                _ greenx: Double, _ greeny: Double, _ greenBrightness: Double,
                                _ bluex: Double, _ bluey: Double, _ blueBrightness: Double) -> Bool {
        
        primaryRed = CIEXYZColor()
        primaryGreen = CIEXYZColor()
        primaryBlue = CIEXYZColor()
        let brSum = redBrightness + greenBrightness + blueBrightness
        
        let redY = redBrightness / brSum
        let greenY = greenBrightness / brSum
        let blueY = blueBrightness / brSum
        
        let redX = redx * redY / redy
        let greenX = greenx * greenY / greeny
        let blueX = bluex * blueY / bluey
        
        let redZ = (1 - redx - redy) * redY / redy
        let greenZ = (1 - greenx - greeny) * greenY / greeny
        let blueZ = (1 - bluex - bluey) * blueY / bluey
        
        return generateByXYZ(redX, redY, redZ, greenX, greenY, greenZ, blueX, blueY, blueZ)
    }
}
