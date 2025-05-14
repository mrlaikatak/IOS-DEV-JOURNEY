//
//  ViewController.swift
//  Calculator
//
//  Created by Yunus ACAR on 29.04.2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var result: UILabel!
    
    var reso = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumButton(_ sender: Any) {
        
        if let firstnumber = Int(number1.text!){
            if let secondnumeber = Int(number2.text!){
                reso = firstnumber + secondnumeber
                result.text = String(reso)
            }
        }
    }
    
    @IBAction func subBut(_ sender: Any) {
        
        if let firstnumber = Int(number1.text!){
            if let secondnumber = Int(number2.text!){
                reso = firstnumber - secondnumber
                result.text = String(reso)
            }
        }
    }
    
    @IBAction func impButton(_ sender: Any) {
        
        if let firstnumber = Int(number1.text!){
            if let secondnumber = Int(number2.text!){
                reso = firstnumber * secondnumber
                result.text = String(reso)
            }
        }
    }
    
    @IBAction func divButton(_ sender: Any) {
        
        if let firstnumber = Int (number1.text!){
            if let secondnumber = Int (number2.text!){
                reso = firstnumber / secondnumber
                result.text = String(reso)
            }
        }
    }
}

