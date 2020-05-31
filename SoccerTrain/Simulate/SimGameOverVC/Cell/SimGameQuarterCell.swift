//
//  SimGameQuarterCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameQuarterCell: UITableViewCell {
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var hQuarter1: UILabel!
    @IBOutlet weak var hQuarter2: UILabel!
    @IBOutlet weak var aQuarter1: UILabel!
    @IBOutlet weak var aQuarter2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
