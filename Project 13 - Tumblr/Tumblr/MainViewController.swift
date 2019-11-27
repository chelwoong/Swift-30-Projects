//
//  ViewController.swift
//  Tumblr
//
//  Created by TTgo on 01/10/2019.
//  Copyright © 2019 TTgo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = transitionManager
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        setupViews()
    }

    func setupViews() {
        
        let toolbar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(toolbar)
        toolbar.barTintColor = .black
        
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        toolbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        toolbar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0).isActive = true
        toolbar.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0).isActive = true
        toolbar.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 0).isActive = true
        
        var items: [UIBarButtonItem] = []
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemTapped(_:)))
        let refreshItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)

        items.append(searchItem)
        items.append(flexibleSpace)
        items.append(addItem)
        items.append(flexibleSpace)
        items.append(refreshItem)

        items.forEach { (item) in
            item.tintColor = .white
        }

        toolbar.items = items
//        toolbar.setItems(items, animated: true)
        
    }
    
    @objc func addItemTapped(_ button: UIBarButtonItem) {
        
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .fullScreen
//        menuVC.transitioningDelegate = self.transitionManager
        self.present(menuVC, animated: true, completion: nil)
    }
    

}

