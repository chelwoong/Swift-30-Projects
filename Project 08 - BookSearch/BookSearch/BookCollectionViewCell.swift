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
        
        return imageView
        
    }()
    
    let bookTitleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let bookAuthorLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let bookDateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(bookImageView)
        self.addSubview(bookDateLabel)
        self.addSubview(bookAuthorLabel)
        self.addSubview(bookTitleLabel)
        bookImageView.contentMode = .scaleAspectFit

        setLayout()
        
        
    }
    
    func setLayout() {

        bookDateLabel.anchor(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 0))
        bookDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bookAuthorLabel.anchor(top: nil, leading: nil, bottom: bookDateLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 0))
        bookAuthorLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bookTitleLabel.anchor(top: nil, leading: nil, bottom: bookAuthorLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 0))
        bookTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bookTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        bookTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        bookImageView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        bookImageView.bottomAnchor.constraint(lessThanOrEqualTo: bookTitleLabel.topAnchor, constant: -10).isActive = true
        bookImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        bookImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10)

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: \(aDecoder)) has not been implemented")
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    
    }
}
