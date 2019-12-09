//
//  ViewController.swift
//  CoolTransition
//
//  Created by TTgo on 26/11/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.transitioningDelegate = transitionManager
        setupViews()
        
//        transitioningDelegate = transitionManager
    }
    
    
    private func setupViews() {
        view.addSubview(showButton)
        
        showButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        showButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        showButton.addTarget(self, action: #selector(didTapShowButton), for: .touchUpInside)
    }
    
    @objc func didTapShowButton() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Views
    private let showButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        
        
        return button
    }()


}

