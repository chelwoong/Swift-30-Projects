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
        
        setCustomTextView(customTextView)
        setChangeButton(changeButton)
        
        customTextView.delegate = self
        customTextView.isScrollEnabled = false
        
    }
    
    @objc
    func changeButtonTapped(sender: UIButton) {
        if let font = fonts.randomElement() {
            customTextView.font = UIFont.init(name: font, size: 25)
        }
    }
    
    func setCustomTextView(_ textView: UITextView) {
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50),
            ])
    }
    
    func setChangeButton(_ button: UIButton) {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: customTextView.bottomAnchor, constant: 50)
            ])
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
