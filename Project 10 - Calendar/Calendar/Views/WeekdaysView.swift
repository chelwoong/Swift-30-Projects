//
//  WeekdaysView.swift
//  Calendar
//
//  Created by woong on 14/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class WeekdaysView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        setupView()
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = UIColor.white
        self.addSubview(myStackView)
        myStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        var daysArr = ["일", "월", "화", "수", "목", "금", "토"]
        for i in 0..<7 {
            let lbl = UILabel()
            lbl.text = daysArr[i]
            lbl.textAlignment = .center
            lbl.translatesAutoresizingMaskIntoConstraints = false
            myStackView.addArrangedSubview(lbl)
        }
        
    }
    
    var myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
