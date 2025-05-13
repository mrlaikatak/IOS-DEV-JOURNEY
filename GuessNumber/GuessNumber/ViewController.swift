//
//  ViewController.swift
//  GuessNumber
//
//  Created by Yunus ACAR on 9.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessLabel: UILabel!
    
    var secretNumber = Int.random(in: 1...10) // 1 ile 10 arasında rastgele sayı üretecek.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessLabel.text = "I picked a number between 1 and 10"
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        guard let guessText = guessTextField.text,
              let guessedNumber = Int(guessText) else {
            guessLabel.text = "Please enter a valid number."
            return
        }

        if guessedNumber < secretNumber {
            guessLabel.text = "Enter a larger number!"
        } else if guessedNumber > secretNumber {
            guessLabel.text = "Enter a smaller number!"
        } else {
            guessLabel.text = "You guessed it right! I got a new number."
            secretNumber = Int.random(in: 1...10)
        }

        guessTextField.text = ""
    }
    
}
