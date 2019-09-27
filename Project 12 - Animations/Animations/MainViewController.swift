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
    let headerHeight = 50.0
    let duration = 1.5
    
    let animations: [Animation] = [.changeColor, .colorFrameChange, .autoChangeColor, .roation2D, .curvePath, .viewFadeIn, ]

    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
        setupNavigation()
        setupConfiguration()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animateTable()
    }
    
    func animateTable() {
        mainTV.reloadData()
        
        let cells = mainTV.visibleCells
        let tableHeight = mainTV.bounds.size.height
        
        // move all cells to the bottom of the screen
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        // move all cells from bottom to the right place
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: duration, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
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

