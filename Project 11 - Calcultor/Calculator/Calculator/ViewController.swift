//
//  ViewController.swift
//  Calculator
//
//  Created by woong on 18/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

enum btnCalculator {
    case plus
    case minus
    case division
    case multiplication
}

class ViewController: UIViewController {
    
    // MARK: - Variables and Propertise
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - functions
    
    func configureTextFields() {
        textFieldResult.delegate = self
    }
    
    private func configureTapGesture() {
        print("tapGesture")

        let tapGesture = UIGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("handle")
        view.endEditing(true)
    }
    
    func setupViews() {
        btnPlus.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnMinus.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnDivision.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnMultiplication.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        
        configureTextFields()
//        configureTapGesture()
    }
    
    // MARK: - Views
    
    @IBOutlet weak var textFieldResult: UITextField!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    @IBOutlet weak var btnMultiplication: UIButton!
    
    // MARK: - Actions

    @objc func btnAction(sender: UIButton) {
        switch sender {
        case btnPlus:
            print("plus")
//            view.endEditing(true)
        case btnMinus:
            print("minus")
        case btnDivision:
            print("division")
        case btnMultiplication:
            print("multiple")
        default:
            print("df")
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldResult.resignFirstResponder()
        return true
    }
}
