//
//  ViewController.swift
//  Todo
//
//  Created by woong on 29/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    // MARK: - Variables and Properties
    var cellIdentifire = "todoCell"
    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

// MARK: - extension TableView DataSource
extension TodoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        
        return cell
    }
    
    
}

// MARK: - extension TableView Delegate
extension TodoViewController: UITableViewDelegate {
    
}
