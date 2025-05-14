//
//  ViewController.swift
//  RandomEmojiApp
//
//  Created by Yunus ACAR on 12.05.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newMojiLabel: UILabel!
    let emojis = ["🍎", "🍌", "🍒", "🍇", "🍉", "🍊", "🍋", "🍍", "🥭", "🥥", "🥝", "🍑", "🍓", "🫐", "🍈", "🍏"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func newMojiButton(_ sender: Any) {
        
        let randomIndex = Int.random(in: 0..<emojis.count)
        newMojiLabel.text = emojis[randomIndex]
    }
    
}

