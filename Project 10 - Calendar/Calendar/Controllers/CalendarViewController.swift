//
//  ViewController.swift
//  Calendar
//
//  Created by woong on 13/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.white
        navigationItem.title = "Calendar"
        
        view.addSubview(calendarView)
        calendarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
    
    let calendarView: CalendarView = {
        let view = CalendarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

}

