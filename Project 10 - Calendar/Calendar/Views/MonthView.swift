//
//  MonthView.swift
//  Calendar
//
//  Created by woong on 17/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

protocol MonthViewDelegate: class {
    func didChangeMonth(monthIndex: Int, year: Int)
}

class MonthView: UIView {
    
    // MARK: - Properties and Variables
    
    var monthsArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var currentMonthIndex = 0
    var currentYear = 0
    var delegate: MonthViewDelegate?
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupViews()
        
    }
    
    @objc
    func btnLeftRightAction(sender: UIButton) {
        if sender == btnRight {
            currentMonthIndex += 1
            print(currentMonthIndex)
            if currentMonthIndex > 11 {
                currentYear += 1
                currentMonthIndex = 0
            }
        } else {
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentYear -= 1
                currentMonthIndex = 11
            }
        }
        
        lblName.text = "\(currentYear) \(monthsArr[currentMonthIndex])"
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
        
    }
    
    func setupViews() {
        self.addSubview(btnLeft)
        btnLeft.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(), size: CGSize(width: 50, height: 0))
        btnLeft.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        self.addSubview(btnRight)
        btnRight.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(), size: CGSize(width: 50, height: 0))
        btnRight.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        self.addSubview(lblName)
        lblName.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: btnLeft.trailingAnchor, bottom: nil, trailing: btnRight.leadingAnchor, padding: .init(), size: CGSize(width: 0, height: self.frame.height))
        lblName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lblName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lblName.text = "\(currentYear) \(monthsArr[currentMonthIndex])"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    
    let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
        
    }()
    
    let btnLeft: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("<", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    let btnRight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(">", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(btnLeftRightAction(sender:)), for: .touchUpInside)
        return button
    }()
}
