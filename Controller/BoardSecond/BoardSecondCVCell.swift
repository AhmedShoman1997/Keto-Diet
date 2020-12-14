//
//  BoardSecondCVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/14/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BoardSecondCVCell: UICollectionViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "WeightCVCell", bundle: nil), forCellWithReuseIdentifier: "WeightCVCell")
        
    
    }

}
extension BoardSecondCVCell: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeightCVCell", for: indexPath) as! WeightCVCell
        return cell
    }
    
    
}
