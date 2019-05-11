//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by woong on 10/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    let videoLauncher = VideoLauncher()
    let localPath = "/Users/os/woong/iOS/Swift-30-Project/Project 05 - PlayLocalVideo/Videos/"
    let videoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let videoCellId = "videoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        videoTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "videoCell")
        
        view.addSubview(videoTableView)
        
        NSLayoutConstraint.activate([
            videoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            videoTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            videoTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            videoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            ])
        
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultcell = tableView.dequeueReusableCell(withIdentifier: videoCellId, for: indexPath)
        guard let cell: VideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: videoCellId, for: indexPath) as? VideoTableViewCell else {
            return defaultcell
        }
        
        if let image = UIImage(named: "v\(indexPath.row+1)") {
            cell.backgroundImgaeView.image = image
        }
        
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let url = URL(fileURLWithPath: localPath + "v\(indexPath.row+1).mp4")
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            player.play()
        }
        
        
    }
}

