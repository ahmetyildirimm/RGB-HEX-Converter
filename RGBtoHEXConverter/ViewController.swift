//
//  ViewController.swift
//  RGBtoHEXConverter
//
//  Created by Ahmet Yıldırım on 24.04.2021.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) { //_ ignore keys olarak geçiyo
        secilenIndex = sender.selectedSegmentIndex
        
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB - HEX Convert", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("HEX - RGB Convert", for: UIControl.State.normal)
        }
    }
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenIndex == 0 {
//            RGB'den HEX'e çevirme işlemi yapılacaktır.
            convertRGBtoHEX()
            
        } else {
//            HEX'ten RGB'ye çevirme yapılacaktır.
            convertHEXtoRGB()
            
        }
        
    }
    
    func convertRGBtoHEX() {
        
        guard let redValue = UInt8(txtRed.text!) else {return}
        guard let greenValue = UInt8(txtGreen.text!) else {return}
        guard let blueValue = UInt8(txtBlue.text!) else {return}
        
//        if let redValue = UInt8(txtRed.text!){
//            if let greenValue = UInt8(txtGreen.text!){
//                if let blueValue = UInt8(txtBlue.text!){
//                    buraya kadar gelinirse kullanıcı değerleri düzgün bir şekilde girmiştir.
                    let redHex = String(format:"%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    
                    lblResult.text = "Hex Color : \n #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1) //renklerin değeri 0 ile 1 arasında olması gerektiği için 255'e böldük

        
    }
    func convertHEXtoRGB() {
        
        guard let redValue = UInt8(txtRed.text!, radix: 16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix:16) else {return}
        guard let blueValue = UInt8(txtBlue.text!, radix: 16) else {return}
        
//        if let amacı = eğer buradaki değer tanımlanabiliyosa tanımlansın tanımlanamıyosa bu kodu çalıştırmama gerek yok , daha fazla çalıştırmamam lazım
        
//        if let redValue = UInt8(txtRed.text!, radix: 16){ //taban değeri 16 hexadecimal olduğu için
//            if let greenValue = UInt8(txtGreen.text!, radix: 16){
//                if let blueValue = UInt8(txtBlue.text!, radix: 16){
                    
                    
                    lblResult.text = "Red : \(redValue) \n Green : \(greenValue) \n Blue : \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)

    }
}

