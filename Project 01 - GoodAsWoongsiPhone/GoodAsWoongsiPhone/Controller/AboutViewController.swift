//
//  AboutViewController.swift
//  GoodAsWoongsiPhone
//
//  Created by woong on 05/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var phoneImageView: UIImageView?
    @IBOutlet weak var mailImageView: UIImageView?
    @IBOutlet weak var githubImageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setToRound(imageView: phoneImageView)
        setToRound(imageView: mailImageView)
        setToRound(imageView: githubImageView)
        
        
    }
    
    // MARK: funcs
    func setToRound(imageView: UIImageView?) {
        if let iv = imageView {
            iv.layer.cornerRadius = 22
            iv.contentMode = .scaleAspectFit
        }
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
