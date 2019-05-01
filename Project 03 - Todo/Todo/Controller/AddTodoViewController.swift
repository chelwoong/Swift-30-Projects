//
//  AddTodoViewController.swift
//  Todo
//
//  Created by woong on 30/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var imageSelectButton: UIButton!
    @IBOutlet weak var todoTextLabel: UILabel!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func imageSelectButtonTapped(_ sender: Any) {
        print("button Tapped")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
