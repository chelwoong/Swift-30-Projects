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
        
        let toolbar = UIToolbar()
        view.addSubview(toolbar)
        toolbar.barTintColor = .black

        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0).isActive = true
        toolbar.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0).isActive = true
        toolbar.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 0).isActive = true
        
//        toolBar.center = CGPoint(x: view.frame.width/2, y: self.view.frame.height - toolBarHeight)
        
        var items: [UIBarButtonItem] = []
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let toolbarItem1 = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        let toolbarItem2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let toolbarItem3 = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)

        items.append(toolbarItem1)
//        items.append(flexibleSpace)
        items.append(toolbarItem2)
//        items.append(flexibleSpace)
//        items.append(toolbarItem3)
        
        items.forEach { (item) in
            item.tintColor = .orange
        }
        
        
        toolbar.setItems(items, animated: true)
        
        
        
        
//        toolBar.setItems(<#T##items: [UIBarButtonItem]?##[UIBarButtonItem]?#>, animated: <#T##Bool#>)
        
        
    }

}

