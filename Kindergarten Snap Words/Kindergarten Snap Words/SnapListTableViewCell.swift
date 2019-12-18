//
//  SnapListTableViewCell.swift
//  Kindergarten Snap Words
//
//  Created by Mobile Apps on 12/18/19.
//  Copyright © 2019 Connor Munro. All rights reserved.
//

import UIKit

class SnapListTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
