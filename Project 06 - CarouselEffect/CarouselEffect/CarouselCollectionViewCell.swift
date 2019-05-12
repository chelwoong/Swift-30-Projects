//
//  CarouselCollectionViewCell.swift
//  CarouselEffect
//
//  Created by woong on 12/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit



class CarouselCollectionViewCell: UICollectionViewCell {
    
    let cellTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.italicSystemFont(ofSize: 30)
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.addSubview(cellTextLabel)
        
        cellTextLabel.frame = self.bounds
        cellTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
