//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headline: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    let eggTime = ["Soft":300, "Medium":480, "Hard":720]
    
    var counter = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progress.progress = 0.0
        timer.invalidate()
        var eggHardness = sender.titleLabel?.text
        headline.text = eggHardness
        counter = eggTime[eggHardness!]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)



        
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= counter {
            let percentageTimePassed:Float = Float(secondsPassed)/Float(counter)
            progress.progress = percentageTimePassed
            secondsPassed += 1
        }
        if counter == 0{
            timer.invalidate()
            headline.text = "Done!"
        }
    }
}
