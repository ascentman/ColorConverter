//
//  CIEXYZColor.swift
//  BegaColorConverter
//
//  Created by Vova on 12/26/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

private enum Constants {
    static let maxX = 1.0
    static let maxY = 1.0
    static let maxZ = 1.0
    static let invalidCompactedColorReturnValue = 0.3333333333
}

protocol IVector3: class {
    
    var a: Double { get set }
    var b: Double { get set }
    var c: Double { get set }
    var length: Double { get }
}

final class CIEXYZColor: IVector3 {
    
    private var _x: Double
    private var _y: Double
    private var _z: Double
    
    init(_ x: Double, _ y: Double, _ z: Double) {
        self._x = x
        self._y = y
        self._z = z
    }
    
    convenience init() {
        self.init(Constants.maxX, Constants.maxY, Constants.maxZ)
    }
    
    var relativeBrightness: Double {
        get {
            return max(x / Constants.maxX, max(y / Constants.maxY, z / Constants.maxZ))
        }
    }
    
    var colorX: Double {
        get {
            let bfr = _x / (_x + _y + _z)
            if bfr.isNaN {
                return Constants.invalidCompactedColorReturnValue
            }
            return bfr
        }
    }
    
    var colorY: Double {
        get {
            let bfr = _y / (_x + _y + _z)
            if bfr.isNaN {
                return Constants.invalidCompactedColorReturnValue
            }
            return bfr
        }
    }
    
    var length: Double {
        get {
            return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))
        }
    }
    
    var x: Double {
        get {
            if _x.isNaN {
                return 0
            }
            return _x
        }
        set {
            if newValue < 0 {
                _x = 0
                return
            }
            if newValue > Constants.maxX {
                _x = Constants.maxX
                return
            }
            _x = newValue
        }
    }
    
    var y: Double {
        get {
            if _y.isNaN {
                return 0
            }
            return _y
        }
        set {
            if newValue < 0 {
                _y = 0
                return
            }
            if newValue > Constants.maxY {
                _y = Constants.maxY
                return
            }
            _y = newValue
        }
    }
    
    var z: Double {
        get {
            if _z.isNaN {
                return 0
            }
            return _z
        }
        set {
            if newValue < 0 {
                _z = 0
                return
            }
            if newValue > Constants.maxZ {
                _z = Constants.maxZ
                return
            }
            _z = newValue
        }
    }
    
    var a: Double {
        get {
            return x
        }
        set {
            x = newValue
        }
    }

    var b: Double {
        get {
            return y
        }
        set {
            y = newValue
        }
    }

    var c: Double {
        get {
            return z
        }
        set {
            z = newValue
        }
    }
    
    func scaleToBrightness(_ brightness: Double) {
        let maxFactor = relativeBrightness
        if maxFactor != 0 {
            var b = brightness
            if b > 1.0 {
                b = 1.0
            }
            if b < 0 {
                b = 0
            }
            let f = brightness / maxFactor
            x *= f
            y *= f
            z *= f
        }
    }
    
    func setByxyAndRelativeBrightness(_ x: Double, _ y: Double, _ brightness: Double) {
        var b = brightness
        if b > 1.0 {
            b = 1.0
        }
        if b < 0 {
            b = 0
        }
        setByxyY(x, y, 1.0)
        self.x *= b
        self.y *= b
        self.z *= b
    }
    
    func setByxyY(_ x: Double, _ y: Double, _ newY: Double) {
        var s = 1.0
        var ox = x * newY / y
        var oy = newY
        var oz = (1.0 - x - y) * newY / y
        
        if ox < 0.0 || oy < 0.0 || oz < 0.0 {
            ox = 0.0
            oy = 0.0
            oz = 0.0
        }
        
        let fx = ox / Constants.maxX
        let fy = oy / Constants.maxY
        let fz = oz / Constants.maxZ
        
        if fx > s {
            s = fx
        }
        if fy > s {
            s = fy
        }
        if fz > s {
            s = fz
        }
        self.x = ox / s
        self.y = oy / s
        self.z = oz / s
    }
    
    func getMaxScalingFactor() -> Double {
        var maxFactor = 0.0
        if x / Constants.maxX > maxFactor {
            maxFactor = x / Constants.maxX
        }
        if y / Constants.maxY > maxFactor {
            maxFactor = y / Constants.maxY
        }
        if z / Constants.maxZ > maxFactor {
            maxFactor = z / Constants.maxZ
        }
        return maxFactor
    }
}
