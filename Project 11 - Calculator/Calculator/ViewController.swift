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
    var nowValue: Double = 0
    var total: Double = 0
    
    // MARK: - LifeCycle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
    }
    
    // MARK: - functions
    
    func add() {
        total += nowValue
        if (total - Double(Int(total))) != 0 {
            textFieldResult.text = "\(total)"
        } else {
            textFieldResult.text = String(format: "%.f", total)
        }
    }
    
    func subtract() {
        total -= nowValue
        if (total - Double(Int(total))) != 0 {
            textFieldResult.text = "\(total)"
        } else {
            textFieldResult.text = String(format: "%.f", total)
        }
    }
    
    func multiply() {
        total *= nowValue
        if (total - Double(Int(total))) != 0 {
            textFieldResult.text = "\(total)"
        } else {
            textFieldResult.text = String(format: "%.f", total)
        }
    }
    
    func divide() {
        total /= nowValue
        if (total - Double(Int(total))) != 0 {
            textFieldResult.text = "\(total)"
        } else {
            textFieldResult.text = String(format: "%.f", total)
        }
        
    }
    
    func clear() {
        total = 0
        nowValue = 0
        textFieldResult.text = "\(0)"
    }
    
    func equal() {
        textFieldResult.text = "\(total)"
    }
    
    func configureTextFields() {
        textFieldResult.delegate = self
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    func setupViews() {
        btnPlus.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnMinus.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnDivision.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnMultiplication.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnEqual.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        btnClear.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
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
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    
    // MARK: - Actions

    @objc func btnAction(sender: UIButton) {
        let active = textFieldResult.isEditing
        switch sender {
        case btnPlus:
            if active {
                add()
            }
        case btnMinus:
            if active {
                subtract()
            }
        case btnDivision:
            if active {
                divide()
            }
        case btnMultiplication:
            if active {
                multiply()
            }
        case btnEqual:
            if active {
                equal()
            }
        case btnClear:
            clear()
        default:
            print("default")
        }
        view.endEditing(true)
    }
    
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        if let text = sender.text, let value = Double(text) {
            nowValue = value
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldResult.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldResult.text = ""
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // restrict textfieid to numbers
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
}
