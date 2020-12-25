//
//  KetoTableTVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/26/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class KetoTableTVCell: UITableViewCell {

    @IBOutlet weak var rectangleImageView: UIImageView!{
        didSet{
            rectangleImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var backImageView: UIImageView!{
        didSet{
            backImageView.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
