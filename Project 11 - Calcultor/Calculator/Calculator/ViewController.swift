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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
//        view.endEditing(true)
        textFieldResult.resignFirstResponder()
    }
    
    func setupViews() {
        btnPlus.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnMinus.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnDivision.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnMultiplication.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        textFieldResult.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        configureTextFields()
        configureTapGesture()
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
        case btnMinus:
            print("minus")
        case btnDivision:
            print("division")
        case btnMultiplication:
            print("multiple")
        default:
            print("df")
        }
        view.endEditing(true)
    }
    
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldResult.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        
        return true
    }
    
}
