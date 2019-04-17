//
//  MemoryTableViewCell.swift
//  GoodAsWoongsiPhone
//
//  Created by woong on 15/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class MemoryTableViewCell: UITableViewCell {
    @IBOutlet weak var memoryImageView: UIImageView!
    @IBOutlet weak var memoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
