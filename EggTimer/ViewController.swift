//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var secondsPassed = 0
    var startCounterTime = 0
    var timer = Timer()
    
    let eggTimer = [
        "Soft": 10,
        "Medium": 30,
        "Hard": 60
    ]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        startCounterTime = eggTimer[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        
        
        if secondsPassed < startCounterTime {
            let valueProgressbar = Float(secondsPassed) / Float(startCounterTime)
            progressBar.progress = Float(valueProgressbar)
            secondsPassed += 1

        }else{
            timer.invalidate()
            eggLabel.text = "Done!"?
            
        }
        
    }
    
}
