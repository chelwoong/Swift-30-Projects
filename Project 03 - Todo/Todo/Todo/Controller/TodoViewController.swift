//
//  ViewController.swift
//  Todo
//
//  Created by woong on 29/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

// MARK: - extension TableView DataSource
extension TodoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

// MARK: - extension TableView Delegate
extension TodoViewController: UITableViewDelegate {
    
}
