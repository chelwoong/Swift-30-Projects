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
    let mainTimer = Stopwatch()
    let lapTimer = Stopwatch()
    var isTimerRunning = false
    let interval = 0.13
    var laps = [Lap]()
    var lapTime: String = ""
    
 
    // MARK: - UI components
    @IBOutlet weak var lapTimeLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var startOrStopButton: UIButton!
    @IBOutlet weak var LapOrResetButton: UIButton!
    @IBOutlet weak var tablewView: UITableView!

    
    
    // MARK: - Actions
    @IBAction func startOrStopButtonTapped(_ sender: Any) {
        if !isTimerRunning {
            mainTimer.timer = Timer.scheduledTimer(
                timeInterval: interval,
                target: self,
                selector: #selector(updateMainTimer),
                userInfo: nil,
                repeats: true
            )
            
            lapTimer.timer = Timer.scheduledTimer(
                timeInterval: interval,
                target: self,
                selector: #selector(updateLapTimer),
                userInfo: nil,
                repeats: true
            )
            
            RunLoop.current.add(mainTimer.timer, forMode: .common)
            RunLoop.current.add(lapTimer.timer, forMode: .common)
            mainTimer.timer.tolerance = 0.1
            lapTimer.timer.tolerance = 0.1
            
            startOrStopButton.setTitle("Stop", for: .normal)
            LapOrResetButton.setTitle("Lap", for: .normal)
            LapOrResetButton.tintColor = UIColor.green
            isTimerRunning = true
        } else {
            mainTimer.timer.invalidate()
            lapTimer.timer.invalidate()
            startOrStopButton.setTitle("Start", for: .normal)
            LapOrResetButton.setTitle("Reset", for: .normal)
            
            isTimerRunning = false
            LapOrResetButton.tintColor = UIColor.red
        }
    }
    
    @IBAction func LapOrResetButtonTapped(_ sender: Any) {
        if isTimerRunning {
            // lap clicked
            
            laps.append(Lap(lapNumber: laps.count, lapTime: lapTime))
            lapTimer.counter = 0.0
            lapTimeLabel.text = "00:00:00:00"
            tablewView.reloadData()
            
        } else {
            // reset clicked
            resetTimer(mainTimer, elapsedTimeLabel)
            resetTimer(lapTimer, lapTimeLabel)
            
        }
        
        
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - Helpers
    
    func resetTimer(_ timer: Stopwatch, _ label: UILabel) {
        timer.counter = 0.0
        label.text = "00:00:00:00"
        laps.removeAll()
        tablewView.reloadData()
    }
    
    @objc
    func updateMainTimer() {
        updateElapsedTimeLabel(mainTimer, elapsedTimeLabel)
    }
    
    @objc
    func updateLapTimer() {
        updateElapsedTimeLabel(lapTimer, lapTimeLabel)
    }
    
    
    func updateElapsedTimeLabel(_ stopwatch: Stopwatch, _ label: UILabel) {
        
        if isTimerRunning {
            
            stopwatch.counter = stopwatch.counter + interval
            let counter = stopwatch.counter
            // HH:MM:SS:_
            let flooredCounter = Int(counter)
            
            let hour = flooredCounter/3600
            
            let minute = (flooredCounter % 3600)/60
            let seconde = (flooredCounter % 3600) % 60
            let decisecond = Int(counter*100) % 100
            lapTime = String(format: "%02d:%02d:%02d:%02d", hour, minute, seconde, decisecond)
            label.text = lapTime
            
        } else {
            // when timer running
        }
    }
}

// MARK: - extension TableView

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell: LapTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LapTableViewCell else {
            return defaultCell
        }
        
        let lap = laps[indexPath.row]
        cell.lapNumberLabel.text = "Lap \(lap.lapNumber + 1)"
        cell.lapTimeLabel.text = lap.lapTime
        return cell
           
    }
    
}

// MARK: - extension Delegate

extension ViewController: UITableViewDelegate {
    
}
