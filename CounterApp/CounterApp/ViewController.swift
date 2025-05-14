//
//  ViewController.swift
//  CounterApp
//
//  Created by Yunus ACAR on 9.05.2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var newNumber: UILabel!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = UserDefaults.standard.integer(forKey: "counter")
        newNumber.text = "\(counter)"
        updateLabelColor()
    }

    func updateLabelColor() {
        switch counter {
        case 0...4:
            newNumber.textColor = UIColor.systemGreen
        case 5...9:
            newNumber.textColor = UIColor.systemBlue
        default:
            newNumber.textColor = UIColor.systemRed
        }
    }

    @IBAction func addButton(_ sender: Any) {
        counter += 1
        newNumber.text = "\(counter)"
        updateLabelColor()
        UserDefaults.standard.set(counter, forKey: "counter")
    }
    
    @IBAction func subButton(_ sender: Any) {
        if counter > 0{
            counter -= 1
            newNumber.text = "\(counter)"
            updateLabelColor()
            UserDefaults.standard.set(counter, forKey: "counter")
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        newNumber.text = "\(counter)"
        updateLabelColor()
        UserDefaults.standard.set(counter, forKey: "counter")
    }
    

}
