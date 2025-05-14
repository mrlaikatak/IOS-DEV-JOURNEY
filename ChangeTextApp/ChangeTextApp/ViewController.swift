//
//  ViewController.swift
//  ChangeTextApp
//
//  Created by Yunus ACAR on 12.05.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    // @IBOutlet arayüzdeki bir bileşeni Swift koduna bağlamak için kullanılır.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeButton(_ sender: Any) {
        textLabel.text = "Hello World!"
        // @IBAction Arayüzdeki bir olaya tepki vermesi için kullanılır.
    }
    
}

