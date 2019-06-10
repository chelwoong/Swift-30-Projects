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
    
    let inspirationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let imageCoverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 33)
        label.textAlignment = .center
        
        return label
    }()
    
    let speakerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        
        return label
    }()
    
    let timeAndRoomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    var inspiration: Inspiration? {
        didSet {
            if let inspiration = inspiration {
                inspirationImageView.image = inspiration.backgroundImage
                titleLabel.text = inspiration.title
                speakerLabel.text = inspiration.speaker
                timeAndRoomLabel.text = inspiration.roomAndTime
            }
        }
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let standardHeight = ExpandingLayoutConstatns.Cell.standardHeight
        let featuredHeight = ExpandingLayoutConstatns.Cell.featuredHeight
        
        
        let delta = 1 - (
            (featuredHeight - frame.height) / (featuredHeight - standardHeight)
        )
        
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        timeAndRoomLabel.alpha = delta
        speakerLabel.alpha = delta
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(inspirationImageView)
        self.addSubview(imageCoverView)
        self.addSubview(titleLabel)
        self.addSubview(speakerLabel)
        self.addSubview(timeAndRoomLabel)
        
        imageCoverView.backgroundColor = UIColor.black
        inspirationImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        inspirationImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        inspirationImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        inspirationImageView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        
        imageCoverView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        imageCoverView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        imageCoverView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        imageCoverView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44)
        
        timeAndRoomLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        timeAndRoomLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        timeAndRoomLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true

        speakerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        speakerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        speakerLabel.topAnchor.constraint(equalTo: timeAndRoomLabel.bottomAnchor, constant: 0).isActive = true

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
