//
//  ViewController.swift
//  Animations
//
//  Created by TTgo on 25/09/2019.
//  Copyright © 2019 TTgo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let cellId = "cellIdentify"
    let animations: [Animation] = [.changeColor, .colorFrameChange, .autoChangeColor, .roation2D, .curvePath, .viewFadeIn, ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupConfiguration()
        setupViews()
    }
    
    func setupNavigation() {
        navigationItem.title = "Fun Animations!"
    }
    
    func setupConfiguration() {
        mainTV.dataSource = self
        mainTV.delegate = self
        mainTV.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(mainTV)
        
        mainTV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainTV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainTV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainTV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    // MARK: - Views
    let mainTV: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = animations[indexPath.row].rawValue
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(animations[indexPath.row]) cell Tapped")
        
        let nextVC = DetailViewController()
        nextVC.animation = animations[indexPath.row]
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

