//
//  HsvConverter.swift
//  BegaColorConverter
//
//  Created by Vova on 12/27/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

final class HSV {
    let h: Double
    let s: Double
    let v: Double
    
    init(h: Double, s: Double, v: Double) {
        self.h = h
        self.s = s
        self.v = v
    }
}

final class HsvConverter {
    
    class func toColorSpace(r: Double, g: Double, b: Double) -> HSV {
        let minValue = min(r, min(g, b))
        let maxValue = max(r, max(g, b))
        let chroma = maxValue - minValue
        var h = 0.0, s = 0.0, v = 0.0
        v = maxValue
        
        if chroma == 0 {
            h = 0
            s = 0
        } else {
            s = chroma / maxValue
            if r == maxValue {
                h = (g - b) / chroma
                if g < b {
                    h += 6.0
                }
            } else if g == maxValue {
                h = 2.0 + ((b - r ) / chroma)
            } else if b == maxValue {
                h = 4 + ((r - g) / chroma)
            }
            h *= 60.0
        }
        return HSV(h: h, s: s, v: v)
    }
    
    class func toColor(item: HSV, colorModel: GenericRGBColorModel) {
        let range = Int32(floor(item.h / 60.0)) % 6
        let f = item.h / 60.0 - floor(item.h / 60.0)
        
        let v = UInt8(round(item.v * 255.0))
        let p = UInt8(round(Double(v) * (1 - item.s)))
        let q = UInt8(round(Double(v) * (1 - f * item.s)))
        let t = UInt8(round(Double(v) * (1 - (1 - f) * item.s)))
        
        switch range {
        case 0:
            colorModel.setByRGB(v, t, p)
            print(v, t, p)
        case 1:
            colorModel.setByRGB(q, v, p)
        case 2:
            colorModel.setByRGB(p, v, t)
        case 3:
            colorModel.setByRGB(p, q, v)
        case 4:
            colorModel.setByRGB(t, p, v)
        default:
            colorModel.setByRGB(v, p, q)
        }
    }
}
