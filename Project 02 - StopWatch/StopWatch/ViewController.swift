//
//  ViewController.swift
//  StopWatch
//
//  Created by woong on 18/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var elapsedTimeLabel: UILabel!
    var timer = Timer()
    var counter = 0.0
    var isRunning = false
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    let watch = Stopwatch()
    
    @IBAction func startButtonTapped(_ sender: Any) {
       Timer.scheduledTimer(
        timeInterval: 0.1,
        target: self,
        selector: #selector(updateElapsedTimeLabel(timer:)),
        userInfo: nil,
        repeats: true
        )
        
        watch.start()
        
    }
    
    @IBAction func stopButtonDidTouch(_ sender: Any) {
        watch.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @objc
    func updateElapsedTimeLabel(timer: Timer) {
        if watch.isRunning {
            let minutes = Int(watch.elapsedTime) / 60
            let seconds = Int(watch.elapsedTime) % 60
            let tenOfSeconds = Int(watch.elapsedTime*10) % 100
            print(watch.elapsedTime)
            print(Int(watch.elapsedTime))
            
            elapsedTimeLabel.text = String(format: "%02d:%02d:%02d", minutes, seconds, tenOfSeconds)
            
        } else {
            timer.invalidate()
        }
    }

}

