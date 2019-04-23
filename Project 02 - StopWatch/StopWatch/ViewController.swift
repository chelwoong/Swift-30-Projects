//
//  ViewController.swift
//  StopWatch
//
//  Created by woong on 18/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    // MARK: - Variables and Properties
    var timer = Timer()
    var counter = 0.0
    var isTimerRunning = false
    let watch = Stopwatch()
    let interval = 0.13
 
    // MARK: - UI components
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - Actions
    @IBAction func startButtonTapped(_ sender: Any) {
       timer = Timer.scheduledTimer(
        timeInterval: interval,
        target: self,
        selector: #selector(updateElapsedTimeLabel),
        userInfo: nil,
        repeats: true
        )
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
        isTimerRunning = true
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
        
        
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Helpers
    @objc
    func updateElapsedTimeLabel() {
        
        if isTimerRunning {
            counter += interval
            // HH:MM:SS:_
            let flooredCounter = Int(counter)
            
            let hour = flooredCounter/3600
            
            let minute = (flooredCounter % 3600)/60
            let seconde = (flooredCounter % 3600) % 60
            let decisecond = Int(counter*100) % 100
            print(counter)
            elapsedTimeLabel.text = String(format: "%02d:%02d:%02d:%02d", hour, minute, seconde, decisecond)
            
        } else {
            // when timer running
        }
        
    }

}

