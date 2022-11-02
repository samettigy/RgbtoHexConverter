//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Samet TIG on 8.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblRed: UITextField!
    
    @IBOutlet weak var lblGreen: UITextField!
    
    @IBOutlet weak var lblBlue: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var btnConvert: UIButton!
    
    @IBOutlet weak var lblSelectedColor: UILabel!
    
    var secilenIndex : Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        secilenIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        lblRed.text?.removeAll()
        lblBlue.text?.removeAll()
        lblGreen.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB - HEX ÇEVİR", for: UIControl.State.normal)
            
            
            
            
        } else {
            btnConvert.setTitle("HEX - RGB ÇEVİR", for: UIControl.State.normal)
        }
        
    }
    
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenIndex == 0 {
//         RGB'den HEX'e çevirme işlemi yapılır
            convertRGBtoHEX()
        } else {
//            HEX'Ten RGB'e çevirme işlemi yapılır
            convertHEXtoRGB()
        }
        
    }
    
    func convertRGBtoHEX() {
        
        if let redValue = UInt8(lblRed.text!) {
            
            if let greenValue = UInt8(lblGreen.text!) {
                
                if let blueValue = UInt8(lblBlue.text!) {
                    
//                     buraya kadar gelindiyse değerler doğru girilmiştir
                    
                    let redHex = String(format : "%2X", redValue)
                    let greenHex = String(format : "%2X", greenValue)
                    let blueHex = String(format : "%2X", blueValue)
                    
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
    }
    
    func convertHEXtoRGB() {
        
        if let redValue = UInt8(lblRed.text!, radix: 16) {
            
            if let greenValue = UInt8(lblGreen.text!, radix: 16 ) {
                
                if let blueValue = UInt8(lblBlue.text!, radix: 16) {
                    
                    lblResult.text = "RED: \(redValue)  \n   GREEN:  \(greenValue)  \n  BLUE:  \(blueValue)"
                    
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                    
                }
                
            }
            
        }
        
    }
    

}

