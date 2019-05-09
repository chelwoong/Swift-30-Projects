//
//  ViewController.swift
//  CustomFont
//
//  Created by woong on 07/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fonts = ["kefa", "papyrus", "zapfino", "bradleyHand"]
    
    let customTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        textView.textAlignment = .center
    
//        textView.isEditable = true
        
        
        return textView
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
        
        view.addSubview(customTextView)
        view.addSubview(changeButton)
        
        [
            customTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
//            customTextView.heightAnchor.constraint(equalToConstant: 50),
//            customTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
//            customTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            customTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            customTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50),
            
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.topAnchor.constraint(equalTo: customTextView.bottomAnchor, constant: 50)
            
        ].forEach{ ($0).isActive = true }
        
        customTextView.delegate = self
        customTextView.isScrollEnabled = false
        
    }
    
    @objc
    func changeButtonTapped(sender: UIButton) {
        print("Font changed")
        
        if let font = fonts.randomElement() {
            customTextView.font = UIFont.init(name: font, size: 25)
            let size = CGSize(width: customTextView.frame.width, height: .infinity)
            let estimatedSize = customTextView.sizeThatFits(size)
            
            customTextView.constraints.forEach { (constraint) in
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
        
    }


}

extension UIViewController: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
