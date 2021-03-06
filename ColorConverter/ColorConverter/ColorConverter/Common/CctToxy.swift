//
//  CctToxy.swift
//  BegaColorConverter
//
//  Created by Vova on 12/26/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

final class CctToxy {
    
    private(set) static var values = [
        2000, 0.53, 0.4123,
        2100, 0.5195, 0.4134,
        2200, 0.5093, 0.4139,
        2300, 0.4995, 0.4138,
        2400, 0.49, 0.4132,
        2500, 0.4808, 0.4122,
        2600, 0.472, 0.4108,
        2700, 0.4636, 0.4091,
        2800, 0.4555, 0.4071,
        2900, 0.4478, 0.405,
        3000, 0.4404, 0.4026,
        3100, 0.4333, 0.4002,
        3200, 0.4266, 0.3976,
        3300, 0.4202, 0.395,
        3400, 0.414, 0.3923,
        3500, 0.4082, 0.3895,
        3600, 0.4026, 0.3868,
        3700, 0.3973, 0.3841,
        3800, 0.3922, 0.3813,
        3900, 0.3873, 0.3786,
        4000, 0.3827, 0.3759,
        4100, 0.3783, 0.3733,
        4200, 0.3741, 0.3707,
        4300, 0.3701, 0.3681,
        4400, 0.3662, 0.3656,
        4500, 0.3625, 0.3631,
        4600, 0.359, 0.3607,
        4700, 0.3557, 0.3583,
        4800, 0.3524, 0.356,
        4900, 0.3494, 0.3538,
        5000, 0.3464, 0.3516,
        5100, 0.3436, 0.3494,
        5200, 0.3409, 0.3473,
        5300, 0.3383, 0.3453,
        5400, 0.3358, 0.3433,
        5500, 0.3334, 0.3413,
        5600, 0.3311, 0.3394,
        5700, 0.3289, 0.3376,
        5800, 0.3268, 0.3358,
        5900, 0.3247, 0.3341,
        6000, 0.3228, 0.3324,
        6100, 0.3209, 0.3307,
        6200, 0.319, 0.3291,
        6300, 0.3173, 0.3275,
        6400, 0.3156, 0.326,
        6500, 0.314, 0.3245,
        6600, 0.3124, 0.3231,
        6700, 0.3109, 0.3217,
        6800, 0.3094, 0.3203,
        6900, 0.308, 0.319,
        7000, 0.3066, 0.3177,
        7100, 0.3053, 0.3164,
        7200, 0.304, 0.3152,
        7300, 0.3028, 0.314,
        7400, 0.3016, 0.3128,
        7500, 0.3004, 0.3117,
        7600, 0.2993, 0.3106,
        7700, 0.2982, 0.3095,
        7800, 0.2971, 0.3084,
        7900, 0.2961, 0.3074,
        8000, 0.2951, 0.3064,
        8100, 0.2942, 0.3054,
        8200, 0.2932, 0.3044,
        8300, 0.2923, 0.3035,
        8400, 0.2914, 0.3026,
        8500, 0.2906, 0.3017,
        8600, 0.2897, 0.3008,
        8700, 0.2889, 0.3,
        8800, 0.2881, 0.2992,
        8900, 0.2874, 0.2983,
        9000, 0.2866, 0.2976,
        9100, 0.2859, 0.2968,
        9200, 0.2852, 0.296,
        9300, 0.2845, 0.2953,
        9400, 0.2839, 0.2946,
        9500, 0.2832, 0.2939,
        9600, 0.2826, 0.2932,
        9700, 0.282, 0.2925,
        9800, 0.2813, 0.2918,
        9900, 0.2808, 0.2912,
        10000, 0.2802, 0.2905
    ]
        
    class func getCctColorX(_ cct: Double) -> Double {
        if cct < 2000 || cct > 10000 {
            return 0
        }
        var indxr = Int((cct / 100).rounded())
        indxr -= 20
        indxr *= 3
        return values[indxr + 1]
    }
    
    class func getCctColorY(_ cct: Double) -> Double {
        if cct < 2000 || cct > 10000 {
            return 0
        }
        var indxr = Int((cct / 100).rounded())
        indxr -= 20
        indxr *= 3
        return values[indxr + 2]
    }
    
    class func calculateCctColorX(_ temperature: Double) -> Double {
        let bfrx = getCctColorX(temperature)
        if bfrx != 0 {
            return bfrx
        }
        var x = 0.333333
        if temperature >= 1667 && temperature <= 4000 {
            x = -0.2661239 * pow(10.0, 9.0) / pow(temperature, 3.0)
            x += -0.2343580 * pow(10.0, 6.0) / pow(temperature, 2.0)
            x += 0.8776956 * pow(10.0, 3.0) / temperature
            x += 0.179910
        }
        if temperature > 4000 && temperature <= 25000 {
            x = -3.0258469 * pow(10.0, 9.0) / pow(temperature, 3.0)
            x += 2.1070379 * pow(10.0, 6.0) / pow(temperature, 2.0)
            x += 0.2226347 * pow(10.0, 3.0) / temperature
            x += 0.240390
        }
        return x
    }
    
    class func calculateCctColorY(_ temperature: Double, x: Double) -> Double {
        let bfry = getCctColorY(temperature)
        if bfry != 0 {
            return bfry
        }
        var y = 0.333333
        if temperature >= 1667 && temperature <= 2222 {
            y = -1.1063814 * pow(x, 3.0)
            y += -1.34811020 * pow(x, 2.0)
            y += 2.18555832 * x
            y += -0.20219683
        }
        if temperature > 4000 && temperature <= 25000 {
            y = 3.0817580 * pow(x, 3.0)
            y += -5.87338670 * pow(x, 2.0)
            y += 3.75112997 * x
            y += -0.37001483
        }
        return y
    }
}
