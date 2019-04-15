//
//  MemoryTableViewController.swift
//  GoodAsWoongsiPhone
//
//  Created by woong on 11/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class MemoryTableViewController: UIViewController {
    
    // MARK: Properties
    
    var memories: [Memory]?
    var cellIdentifire = "memoryCell"
    
    // MARK: ViewController override method

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memories = [
            Memory(memory: "mju univ", memoryImageName: "mjuLogo", fullScreenImageName: "mjuLogo"),
            Memory(memory: "learn React", memoryImageName: "reactLogo", fullScreenImageName: "reactLogo"),
            Memory(memory: "start iOS", memoryImageName: "swiftLogo", fullScreenImageName: "swiftLogo"),
            Memory(memory: "be iOS Developer", memoryImageName: "iosLogo", fullScreenImageName: "iosLogo")
        ]
        
        
    }
    
    func setToRound(imageView: UIImageView) -> UIImageView {

        let iv = imageView
        iv.layer.cornerRadius = 22
        iv.contentMode = .scaleAspectFit
        
        return iv
//
//        if let iv = imageView {
//            iv.layer.cornerRadius = 22
//            iv.contentMode = .scaleAspectFit
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: UITableViewDataSource

extension MemoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: MemoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? MemoryTableViewCell else {return UITableViewCell()}
        
        guard let memories = memories else {return cell}
        

        cell.memoryLabel.text = memories[indexPath.row].memory
        if let imageName = memories[indexPath.row].memoryImageName {
            cell.memoryImageView.image = UIImage(named: imageName)
        }
        
        cell.imageView?.layer.cornerRadius = 22
        cell.imageView?.contentMode = .scaleAspectFit
        
        
        return cell
    }
    
    
    
    
}

// MARK: UITableViewDelegate

extension MemoryTableViewController: UITableViewDelegate {
    
}
