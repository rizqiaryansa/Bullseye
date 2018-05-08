//
//  ViewController.swift
//  Bullseye
//
//  Created by Rizqi Aryansa on 08/05/18.
//  Copyright © 2018 Rizqi Aryansa. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactMode: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var counter = 0
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber = Int(arc4random_uniform(101))
        numLabel?.text = "Move the slider to: \(randomNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increase(_ sender: Any) {
        counter += 1
        numLabel.text = "\(counter)"
    }
    
    @IBAction func decrement(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            counter = 0
        }
        numLabel.text = "\(counter)"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        numLabel.text = "Move the slider to: \(round(numSlider.value))"
    }
    
    @IBAction func checkValue(_ sender: Any) {
        
        if exactMode.isOn == false {
            if Int(numSlider.value) >= randomNumber-3 && Int(numSlider.value) <= randomNumber+3 {
                resultLabel.text = "You were right on point! Bullseye"
                resultLabel.backgroundColor = UIColor.green
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
                resultLabel.backgroundColor = UIColor.red
            }
        } else {
            if randomNumber == Int(numSlider.value){
                resultLabel.text = "You were right on point! Bullseye"
                resultLabel.backgroundColor = UIColor.green
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
                resultLabel.backgroundColor = UIColor.red
            }
        }
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel?.text = "Move the slider to: \(randomNumber)"
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    
    
}

