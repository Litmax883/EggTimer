//
//  ViewController.swift
//  EggTimer
//
//  Created by MAC on 02.10.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    let eggTimes = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    var secondsRemaining = 60
    var min = 1
    var sec = 1
    var hardness = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var softEgg: UIImageView!
    @IBOutlet weak var mediumEgg: UIImageView!
    @IBOutlet weak var hardEgg: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        timer.invalidate()
        hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 30)
        progressView.tintColor = .yellow
        progressView.progressTintColor = .yellow
        progressView.backgroundColor = .none
        
        
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            min = secondsRemaining / 60
            sec = secondsRemaining - (min * 60)
            
            progressView.progress = Float(eggTimes[hardness]! - secondsRemaining) / Float(eggTimes[hardness]!)
            
            label.text = "Time to end: \(min) minutes, \(sec) seconds"
            secondsRemaining -= 1
        } else {
            label.text = "End of boiling"
            timer.invalidate()
        }
        
        
    }
    
    
    
    
}
