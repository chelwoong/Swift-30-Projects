//
//  ViewController.swift
//  Tumblr
//
//  Created by TTgo on 01/10/2019.
//  Copyright © 2019 TTgo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
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
            item.tintColor = .orange
        }

        toolbar.items = items
//        toolbar.setItems(items, animated: true)
        
    }
    
    @objc func addItemTapped(_ button: UIBarButtonItem) {
        
        let menuVC = MenuViewController()
        self.present(menuVC, animated: true, completion: nil)
    }
    

}

