//
//  VideoTableViewCell.swift
//  PlayLocalVideo
//
//  Created by woong on 10/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    let backgroundImgaeView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(backgroundImgaeView)
        
//        backgroundImgaeView.backgroundColor = UIColor.green
        
        NSLayoutConstraint.activate([
//            backgroundImgaeView.widthAnchor.constraint(equalToConstant: bounds.width),
            backgroundImgaeView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroundImgaeView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            backgroundImgaeView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0),
            backgroundImgaeView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.addSubview(backgroundImgaeView)
//        backgroundImgaeView.backgroundColor = UIColor.green
//
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
