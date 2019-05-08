//
//  ViewController.swift
//  CustomFont
//
//  Created by woong on 07/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.red
        return textField
    }()
    
    let changeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Font", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Custom Font"
        view.backgroundColor = UIColor.white
        
        
        view.addSubview(customTextField)
        view.addSubview(changeButton)
        
        customTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        customTextField.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        customTextField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        customTextField.bottomAnchor.constraint(equalTo: changeButton.topAnchor, constant: -50).isActive = true
        
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        changeButton.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 50).isActive = true
        changeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        
    }
    
    @objc
    func changeButtonTapped(sender: UIButton) {
        print("Font changed")
    }


}

