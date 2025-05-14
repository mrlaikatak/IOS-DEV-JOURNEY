//
//  ViewController.swift
//  NewCounterApp
//
//  Created by Yunus ACAR on 12.05.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moreButton(_ sender: Any) {
        
        counter += 1
        numberLabel.text = "\(counter)"

    }
    
}

