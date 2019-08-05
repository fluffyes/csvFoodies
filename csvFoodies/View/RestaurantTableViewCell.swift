//
//  RestaurantTableViewCell.swift
//  csvFoodies
//
//  Created by Soulchild on 05/08/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Add the ">" on cell
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
