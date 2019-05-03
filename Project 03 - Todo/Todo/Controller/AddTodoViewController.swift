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
    
    

    @IBOutlet weak var imageSelectButton: UIButton!
    @IBOutlet weak var todoTextLabel: UILabel!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func imageSelectButtonTapped(_ sender: AnyObject) {
        print("button Tapped")

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let popoverController = segue.destination.popoverPresentationController, let button = sender as? UIButton {
            popoverController.delegate = self
            popoverController.sourceRect = button.bounds
            
        }
    }
    
   

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
