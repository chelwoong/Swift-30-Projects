//
//  SecondViewController.swift
//  CoolTransition
//
//  Created by TTgo on 26/11/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.transitioningDelegate = transitionManager
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(hideButton)
        
        hideButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        hideButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        hideButton.addTarget(self, action: #selector(didTapHideButton), for: .touchUpInside)
    }
    
    @objc func didTapHideButton() {
        
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Views
    private let hideButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("hide", for: .normal)
        
        
        return button
    }()

}
