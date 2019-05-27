//
//  BookCollectionViewCell.swift
//  BookSearch
//
//  Created by woong on 25/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = UIColor.yellow
        return imageView
        
    }()
    
    let bookNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let bookDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.red
        self.addSubview(bookImageView)
        bookImageView.contentMode = .scaleAspectFit
        bookImageView.clipsToBounds = false
        self.addSubview(bookNameLabel)
        self.backgroundColor = UIColor.white
        self.addSubview(bookAuthorLabel)
        self.addSubview(bookDateLabel)
//
        setLayout()
        
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            
            bookImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            bookImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bookImageView.leftAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.leftAnchor),
            bookImageView.rightAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.rightAnchor),
            bookImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
//            bookImageView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.bottomAnchor, multiplier: -10),
//            bookImageView.bottomAnchor.constraint(equalTo: bookNameLabel.topAnchor, constant: -10),
            
//            bookImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            bookImageView.leftAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.leftAnchor),
//            bookImageView.rightAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.rightAnchor),
//            bookImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            bookNameLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 10),
            bookNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            bookNameLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),

            bookAuthorLabel.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 5),
            bookAuthorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            bookDateLabel.topAnchor.constraint(equalTo: bookAuthorLabel.bottomAnchor, constant: 5),
            bookDateLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            bookDateLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),

            ])
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: \(aDecoder)) has not been implemented")
    }
}
