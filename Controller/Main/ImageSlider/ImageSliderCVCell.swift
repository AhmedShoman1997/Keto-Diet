//
//  ImageSliderCVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/24/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class ImageSliderCVCell: UICollectionViewCell {

    @IBOutlet weak var maskImageView: UIImageView!{
        didSet{
            maskImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var rectangleImageView: UIImageView!{
        didSet{
            rectangleImageView.layer.cornerRadius = 10
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
