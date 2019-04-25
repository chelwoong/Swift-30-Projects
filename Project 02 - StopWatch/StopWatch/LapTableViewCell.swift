//
//  LapTableViewCell.swift
//  StopWatch
//
//  Created by woong on 25/04/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class LapTableViewCell: UITableViewCell {
    @IBOutlet weak var lapNumberLabel: UILabel!
    @IBOutlet weak var lapTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
