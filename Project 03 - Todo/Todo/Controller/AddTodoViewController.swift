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
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidApper")
     
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
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
}

extension AddTodoViewController: PopoverDelegate {
    func setButtonImage(_ image: UIImage) {
        imageSelectButton.setImage(image, for: .normal)
    }
}
