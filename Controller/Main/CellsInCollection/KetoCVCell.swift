//
//  KetoCVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/27/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class KetoCVCell: UICollectionViewCell {
    @IBOutlet weak var backView:
        UIView!{
        didSet{
            backView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var backImage: UIImageView!{
        didSet{
            backImage.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var rectangleImage: UIImageView!{
        didSet{
            rectangleImage.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
