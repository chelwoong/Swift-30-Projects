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
    let interval = 0.13
    var laps = [Lap]()
    var lapTime: String = ""
 
    // MARK: - UI components
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var startOrStopButton: UIButton!
    @IBOutlet weak var LapOrResetButton: UIButton!
    @IBOutlet weak var tablewView: UITableView!

    
    
    // MARK: - Actions
    @IBAction func startOrStopButtonTapped(_ sender: Any) {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(
                timeInterval: interval,
                target: self,
                selector: #selector(updateElapsedTimeLabel),
                userInfo: nil,
                repeats: true
            )
            
            startOrStopButton.setTitle("Stop", for: .normal)
            LapOrResetButton.setTitle("Lap", for: .normal)
            isTimerRunning = true
        } else {
            timer.invalidate()
            startOrStopButton.setTitle("Start", for: .normal)
            LapOrResetButton.setTitle("Reset", for: .normal)
            isTimerRunning = false
        }
    }
    
    @IBAction func LapOrResetButtonTapped(_ sender: Any) {
        if isTimerRunning {
            print("lap")
            
            laps.append(Lap(lapNumber: laps.count, lapTime: lapTime))
            tablewView.reloadData()
            print(laps)
            
            
            
        } else {
            print("reset")
            LapOrResetButton.setTitle("Lap", for: .normal)
        }
        
        
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
            lapTime = String(format: "%02d:%02d:%02d:%02d", hour, minute, seconde, decisecond)
            elapsedTimeLabel.text = lapTime
            
        } else {
            // when timer running
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return laps?.count ?? 0
        print("laps Count: \(laps.count)")
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

extension ViewController: UITableViewDelegate {
    
}
