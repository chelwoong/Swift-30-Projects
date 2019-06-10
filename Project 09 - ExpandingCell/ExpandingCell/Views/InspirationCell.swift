//
//  InspirationCell.swift
//  ExpandingCell
//
//  Created by woong on 07/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class InspirationCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: InspirationCell.self)
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var inspiration: Inspiration? {
        didSet {
            if let inspiration = inspiration {
                imageView.image = inspiration.backgroundImage
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
