//
//  FullMemoryViewController.swift
//  GoodAsWoongsiPhone
//
//  Created by woong on 16/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class FullMemoryViewController: UIViewController {
    
    // MARK: Properties
    
    var memoryImageView: UIImageView?
    var rememberLabel: UILabel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var remeberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if var text = remeberButton.titleLabel?.text {
            text += rememberLabel?.text ?? ""
            self.remeberButton.setTitle(text, for: .normal)
        }
        imageView.image = memoryImageView?.image
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
