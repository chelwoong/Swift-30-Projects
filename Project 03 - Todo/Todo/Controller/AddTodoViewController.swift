//
//  AddTodoViewController.swift
//  Todo
//
//  Created by woong on 30/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // MARK: - Variables and Properties
    var popOverVC = "popOverViewController"
    var todoes: [Todo]?
    var date: String = ""
    let todoViewVC = "todoViewController"
    var addTodoDelegate: AddTodo?
    
    @IBOutlet weak var imageSelectButton: UIButton!
    @IBOutlet weak var todoTextLabel: UILabel!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    // MARK: - Actions
    @IBAction func imageSelectButtonTapped(_ sender: AnyObject) {
        print("button Tapped")

    }
    
    @IBAction func datePicked(_ sender: Any) {
        if let datePicker = sender as? UIDatePicker {
            datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        }
    }
    @IBAction func addTodo(_ sender: Any) {
        let todo = Todo()
        todo.todoName = todoTextField.text
        todo.todoDate = date
        
        todo.todoIcon = imageSelectButton.currentImage
        addTodoDelegate?.addTodo(todo)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        initDate()
        
        
        imageSelectButton.setImage("😀".image(), for: .normal)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let popoverController = segue.destination as? PopoverViewController, let button = sender as? UIButton {
            popoverController.emojiDelegate = self
            popoverController.popoverPresentationController?.delegate = self
            popoverController.popoverPresentationController?.sourceRect = button.bounds
        }
    }
    
    // MARK: - functions
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("popovered")
        // 프로그래밍 방법으로 dismiss를 할 때는 실행되지 않는다.
        /*
     The popover presentation controller calls this method in response to user-initiated attempts to dismiss the popover.
         It is not called when you dismiss the popover programmatically using the dismissModalViewControllerAnimated: method.
         */
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    @objc
    func dateChanged() {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        let date = dateformatter.string(from: datePicker.date)
        self.date = date
        print(self.date)
    }
    
    func initDate() {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        let date = dateformatter.string(from: datePicker.date)
        print(date)
        self.date = date
    }
}

extension AddTodoViewController: PopoverDelegate {
    func setButtonImage(_ image: UIImage) {
        imageSelectButton.setImage(image, for: .normal)
    }
}
