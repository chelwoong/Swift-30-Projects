//
//  ViewController.swift
//  Calculator
//
//  Created by woong on 18/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

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
        setTextField()
    }
    
    func subtract() {
        total -= nowValue
        setTextField()
    }
    
    func multiply() {
        total *= nowValue
        setTextField()
    }
    
    func divide() {
        // 예외처리
        total /= nowValue
        if (total.isNaN || total.isInfinite) {
            total = 0
            nowValue = 0
        }
        setTextField()
        
    }
    
    func clear() {
        total = 0
        nowValue = 0
        textFieldResult.text = "\(0)"
    }
    
    func equal() {
        textFieldResult.text = "\(total)"
    }
    
    func setTextField() {
        if (total - Double(Int(total))) != 0 {
            textFieldResult.text = "\(total)"
        } else {
            textFieldResult.text = String(format: "%.f", total)
        }
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
        let buttonArray: [UIButton] = [btnPlus, btnMinus, btnDivision, btnMultiplication, btnEqual, btnClear]
        
        for button in buttonArray {
            button.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        }
        
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
        guard let tag: CalculationOperator = CalculationOperator(rawValue: sender.tag) else {return}
        let active = textFieldResult.isEditing
        
        enum CalculationOperator: Int {
            case plus = 1
            case minus
            case division
            case multiple
            case equal
        }
        
        
        
        if active {
            switch tag {
            case .plus where active == true:
                    add()
            case .minus:
                if active {
                    subtract()
                }
            case .division:
                if active {
                    divide()
                }
            case .multiple:
                if active {
                    multiply()
                }
            case .equal:
                if active {
                    equal()
                }
            default:
                print("default")
            }
        } else if sender == btnClear {
            clear()
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
