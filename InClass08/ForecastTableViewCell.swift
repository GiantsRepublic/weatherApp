//
//  ForecastTableViewCell.swift
//  InClass08
//
//  Created by Jason Wei on 3/24/19.
//  Copyright © 2019 Kaifan Wei. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var tempMaxLabel: UILabel!
    @IBOutlet var tempMinLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
