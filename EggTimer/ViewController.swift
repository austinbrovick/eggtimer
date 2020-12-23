//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let eggTimes : [String: Int] = ["Soft": 3, "Medium": 5, "Hard": 7]
    
    var secondsRemaining = 60
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    var timer = Timer()
    var hardness : String? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        progressBar.progress = 0
        timer.invalidate()
        
        hardness = sender.currentTitle!
        print(eggTimes[hardness!]!)
        
        secondsRemaining = eggTimes[hardness!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(theMethod), userInfo: nil, repeats: true)
    }
    
    @objc func theMethod() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            print("\(secondsRemaining) seconds.")
            let totalSeconds = Float(eggTimes[hardness!]!)
            progressBar.progress = (totalSeconds - Float(secondsRemaining))/totalSeconds
        } else {
            titleLabel.text = "DONE"
        }
    }
    
}
