//
//  ViewController.swift
//  BegaColorConverter
//
//  Created by Vova on 12/26/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit
import ColorConverter

private enum ColorModels : String {
    case model1 = "sRGB"
    case model2 = "BegaRGB"
}

private enum Methods : String {
    case method1 = "RGB to xyY / HSV"
    case method2 = "xyY to RGB / HSV"
    case method3 = "HSV to RGB / xyY"
}

final class ColorConverterTableViewController: UITableViewController {

    @IBOutlet private weak var colorModelButton: UIButton!
    @IBOutlet private var colorModels: [UIButton]!
    @IBOutlet private weak var methodButton: UIButton!
    @IBOutlet private var convertingMethods: [UIButton]!
    @IBOutlet private weak var rRGBTextField: UITextField!
    @IBOutlet private weak var gRGBTextField: UITextField!
    @IBOutlet private weak var bRGBTextField: UITextField!
    @IBOutlet private weak var xXYZTextField: UITextField!
    @IBOutlet private weak var yXYZTextField: UITextField!
    @IBOutlet private weak var zXYZTextField: UITextField!
    @IBOutlet private weak var xxyYTextField: UITextField!
    @IBOutlet private weak var yxyYTextField: UITextField!
    @IBOutlet private weak var yUpperxyYTextField: UITextField!
    @IBOutlet private weak var hHSVTextField: UITextField!
    @IBOutlet private weak var sHSVTextField: UITextField!
    @IBOutlet private weak var vHSVTextField: UITextField!
    @IBOutlet private weak var xCCTxyYTextField: UITextField!
    @IBOutlet private weak var yCCTxyYTextField: UITextField!
    @IBOutlet private weak var cctTextField: UITextField!
    
    @IBAction func selectColorModelPressed(_ sender: UIButton) {
        colorModelButton.setTitle("Select a color model", for: .normal)
        animateDropDownMenu(collection: colorModels)
    }
    
    @IBAction func colorModelPicked(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let colorModel = ColorModels(rawValue: title) else {
                return
        }
        switch colorModel {
        case .model1:
            colorModelButton.setTitle(ColorModels.model1.rawValue, for: .normal)
            animateDropDownMenu(collection: colorModels)
        case .model2:
            colorModelButton.setTitle(ColorModels.model2.rawValue, for: .normal)
            animateDropDownMenu(collection: colorModels)
        }
    }
    
    @IBAction func selectMethodPressed(_ sender: Any) {
        methodButton.setTitle("Select method", for: .normal)
        animateDropDownMenu(collection: convertingMethods)
    }
    
    @IBAction func methodPicked(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let method = Methods(rawValue: title) else {
                return
        }
        switch method {
        case .method1:
            methodButton.setTitle(Methods.method1.rawValue, for: .normal)
            clearTextFields()
            animateDropDownMenu(collection: convertingMethods)
            activeRGBFields()
        case .method2:
            methodButton.setTitle(Methods.method2.rawValue, for: .normal)
            clearTextFields()
            animateDropDownMenu(collection: convertingMethods)
            activeXyYFields()
        case .method3:
            methodButton.setTitle(Methods.method3.rawValue, for: .normal)
            clearTextFields()
            animateDropDownMenu(collection: convertingMethods)
            activeHSVFields()
        }
    }
    
    @IBAction func convertPressed(_ sender: Any) {
        if rRGBTextField.isEnabled {
            colorConversionRGBtoHSVandxyY()
        }
        if xxyYTextField.isEnabled {
            colorConversionxyYToRGBandHSV()
        }
        if hHSVTextField.isEnabled {
            colorConversionHSVToRGBandxyY()
        }
    }
    
    @IBAction func convertCCTPressed(_ sender: Any) {
        cctConvert()
    }
    
    // MARK: - Private
    
    private func colorConversionRGBtoHSVandxyY() {
        if let r = rRGBTextField.text,
            let g = gRGBTextField.text,
            let b = bRGBTextField.text,
            !r.isEmpty, !g.isEmpty, !b.isEmpty {
            bRGBTextField.resignFirstResponder()
            
            if let rValue = Double(r),
                let gValue = Double(g),
                let bValue = Double(b) {
                // MARK: - sRGB
                if colorModelButton.currentTitle == ColorModels.model1.rawValue {
                    let convertToXyY = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), r: rValue, g: gValue, b: bValue)
                    xxyYTextField.text = String(convertToXyY.x)
                    yxyYTextField.text = String(convertToXyY.y)
                    yUpperxyYTextField.text = String(convertToXyY.relativeBrightness)
                    
                    let convertToXYZ = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), r: rValue, g: gValue, b: bValue)
                    xXYZTextField.text = String(convertToXYZ.x)
                    yXYZTextField.text = String(convertToXYZ.y)
                    zXYZTextField.text = String(convertToXYZ.z)
                    
                    let convertToHSV = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), r: rValue, g: gValue, b: bValue)
                    hHSVTextField.text = String(convertToHSV.h)
                    sHSVTextField.text = String(convertToHSV.s)
                    vHSVTextField.text = String(convertToHSV.v)
                // MARK: - begaRGB
                } else if colorModelButton.currentTitle == ColorModels.model2.rawValue {
                    let convertToXyY = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), r: rValue, g: gValue, b: bValue)
                    xxyYTextField.text = String(convertToXyY.x)
                    yxyYTextField.text = String(convertToXyY.y)
                    yUpperxyYTextField.text = String(convertToXyY.relativeBrightness)
                    
                    let convertToXYZ = ColorConverter.convertToXYZ(colorModelType: .predefined(.begasRGB), r: rValue, g: gValue, b: bValue)
                    xXYZTextField.text = String(convertToXYZ.x)
                    yXYZTextField.text = String(convertToXYZ.y)
                    zXYZTextField.text = String(convertToXYZ.z)
                    
                    let convertToHSV = ColorConverter.convertToHSV(colorModelType: .predefined(.begasRGB), r: rValue, g: gValue, b: bValue)
                    hHSVTextField.text = String(convertToHSV.h)
                    sHSVTextField.text = String(convertToHSV.s)
                    vHSVTextField.text = String(convertToHSV.v)
                }
            }
        }
    }
    
    private func colorConversionxyYToRGBandHSV() {
        if let x = xxyYTextField.text,
            let y = yxyYTextField.text,
            let Y = yUpperxyYTextField.text,
            !x.isEmpty, !y.isEmpty, !Y.isEmpty {
            yUpperxyYTextField.resignFirstResponder()
            if let xValue = Double(x),
                let yValue = Double(y),
                let YValue = Double(Y) {
                // MARK: - sRGB
                if colorModelButton.currentTitle == ColorModels.model1.rawValue {
                    let convertToRGB = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), x: xValue, y: yValue, Y: YValue)
                    rRGBTextField.text = String(convertToRGB.r)
                    gRGBTextField.text = String(convertToRGB.g)
                    bRGBTextField.text = String(convertToRGB.b)
                    
                    let convertToHSV = ColorConverter.convertToHSV(colorModelType: .predefined(.rgb), x: xValue, y: yValue, Y: YValue)
                    hHSVTextField.text = String(convertToHSV.h)
                    sHSVTextField.text = String(convertToHSV.s)
                    vHSVTextField.text = String(convertToHSV.v)
                // MARK: - begaRGB
                } else if colorModelButton.currentTitle == ColorModels.model2.rawValue {
                let convertToRGB = ColorConverter.convertToRGB(colorModelType: .predefined(.begasRGB), x: xValue, y: yValue, Y: YValue)
                rRGBTextField.text = String(convertToRGB.r)
                gRGBTextField.text = String(convertToRGB.g)
                bRGBTextField.text = String(convertToRGB.b)
                
                let convertToHSV = ColorConverter.convertToHSV(colorModelType: .predefined(.begasRGB), x: xValue, y: yValue, Y: YValue)
                hHSVTextField.text = String(convertToHSV.h)
                sHSVTextField.text = String(convertToHSV.s)
                vHSVTextField.text = String(convertToHSV.v)
                }
            }
        }
    }
    
    private func colorConversionHSVToRGBandxyY() {
        if let hi = hHSVTextField.text,
            let si = sHSVTextField.text,
            let vi = vHSVTextField.text,
            !hi.isEmpty, !si.isEmpty, !vi.isEmpty {
            vHSVTextField.resignFirstResponder()
            
            if let h = Double(hi),
                let s = Double(si),
                let v = Double(vi) {
                if h > 360.0 || s > 100.0 || v > 100.0 {
                    return
                }
                
                // MARK: - sRGB
                if colorModelButton.currentTitle == ColorModels.model1.rawValue {
                    
                    let convertToRGB = ColorConverter.convertToRGB(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
                    rRGBTextField.text = String(convertToRGB.r)
                    gRGBTextField.text = String(convertToRGB.g)
                    bRGBTextField.text = String(convertToRGB.b)
                    
                    let convertToXyY = ColorConverter.convertToXyY(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
                    xxyYTextField.text = String(convertToXyY.x)
                    yxyYTextField.text = String(convertToXyY.y)
                    yUpperxyYTextField.text = String(convertToXyY.relativeBrightness)
                    
                    
                    let convertToXYZ = ColorConverter.convertToXYZ(colorModelType: .predefined(.rgb), h: h, s: s, v: v)
                    xXYZTextField.text = String(convertToXYZ.x)
                    yXYZTextField.text = String(convertToXYZ.y)
                    zXYZTextField.text = String(convertToXYZ.z)
                    
                // MARK: - begaRGB
                } else if colorModelButton.currentTitle == ColorModels.model2.rawValue {
                    let convertToRGB = ColorConverter.convertToRGB(colorModelType: .predefined(.begasRGB), h: h, s: s, v: v)
                    rRGBTextField.text = String(convertToRGB.r)
                    gRGBTextField.text = String(convertToRGB.g)
                    bRGBTextField.text = String(convertToRGB.b)
                    
                    let convertToXyY = ColorConverter.convertToXyY(colorModelType: .predefined(.begasRGB), h: h, s: s, v: v)
                    xxyYTextField.text = String(convertToXyY.x)
                    yxyYTextField.text = String(convertToXyY.y)
                    yUpperxyYTextField.text = String(convertToXyY.relativeBrightness)
                    
                    let convertToXYZ = ColorConverter.convertToXYZ(colorModelType: .predefined(.begasRGB), h: h, s: s, v: v)
                    xXYZTextField.text = String(convertToXYZ.x)
                    yXYZTextField.text = String(convertToXYZ.y)
                    zXYZTextField.text = String(convertToXYZ.z)
                }
            }
        }
    }
    
    private func cctConvert() {
        if let cctText = cctTextField.text,
            !cctText.isEmpty {
            cctTextField.resignFirstResponder()
            if let cct = Double(cctText) {
                let convertCct = ColorConverter.convertToXyY(cct: cct)
                xCCTxyYTextField.text = String(convertCct.x)
                yCCTxyYTextField.text = String(convertCct.y)
            }
        }
    }
    
    private func animateDropDownMenu(collection: [UIButton]) {
        collection.forEach { (button) in
            UIView.animate(withDuration: 0.5, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    private func clearTextFields() {
        rRGBTextField.text = ""
        gRGBTextField.text = ""
        bRGBTextField.text = ""
        xXYZTextField.text = ""
        yXYZTextField.text = ""
        zXYZTextField.text = ""
        xxyYTextField.text = ""
        yxyYTextField.text = ""
        yUpperxyYTextField.text = ""
        hHSVTextField.text = ""
        sHSVTextField.text = ""
        vHSVTextField.text = ""
    }
    
    private func activeRGBFields() {
        rRGBTextField.isEnabled = true
        gRGBTextField.isEnabled = true
        bRGBTextField.isEnabled = true
        
        xxyYTextField.isEnabled = false
        yxyYTextField.isEnabled = false
        yUpperxyYTextField.isEnabled = false
        
        hHSVTextField.isEnabled = false
        sHSVTextField.isEnabled = false
        vHSVTextField.isEnabled = false
        view.layoutIfNeeded()
    }
    
    private func activeXyYFields() {
        rRGBTextField.isEnabled = false
        gRGBTextField.isEnabled = false
        bRGBTextField.isEnabled = false
        
        xxyYTextField.isEnabled = true
        yxyYTextField.isEnabled = true
        yUpperxyYTextField.isEnabled = true
        
        hHSVTextField.isEnabled = false
        sHSVTextField.isEnabled = false
        vHSVTextField.isEnabled = false
        view.layoutIfNeeded()
    }
    
    private func activeHSVFields() {
        xxyYTextField.isEnabled = false
        yxyYTextField.isEnabled = false
        yUpperxyYTextField.isEnabled = false
        
        rRGBTextField.isEnabled = false
        gRGBTextField.isEnabled = false
        bRGBTextField.isEnabled = false
        
        hHSVTextField.isEnabled = true
        sHSVTextField.isEnabled = true
        vHSVTextField.isEnabled = true
        view.layoutIfNeeded()
    }
}

extension ColorConverterTableViewController: UITextViewDelegate {
    
    // MARK: - UITextFieldDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
