//
//  AboutTableViewCell.swift
//  Kindergarten Snap Words
//
//  Created by Kristen Munro on 11/20/19.
//  Copyright © 2019 Connor Munro. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell
{
    let blurb: UILabel =
    {
        let text = UILabel()
        text.text = "This app was developed by a kindergartener and his parents, for kindergarteners everywhere to help learn snap words on the go!"
        text.textColor = cyan
        text.font = UIFont(name: "MarkerFelt-Thin", size: 25)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let credits: UILabel =
    {
        let text = UILabel()
        text.text = "Designed by: The Kahook Family \rProgrammers: Ron Gunczler & Connor Munro \rProject mgmt: Joshua Steinberg MD \rFeedback: nida.kahook@gmail.com \rVersion: 1.0 \rCopyright: March 30th, 2019"
        text.textColor = cyan
        text.font = UIFont(name: "MarkerFelt-Thin", size: 15)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
