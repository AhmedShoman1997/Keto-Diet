//
//  CellForTwoTVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/26/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class CellForTwoTVCell: UITableViewCell {
    
    let images = [#imageLiteral(resourceName: "rectangle-4"),#imageLiteral(resourceName: "rectangle-5")]
    let titles = ["أسئلة وأجوبة","قصص نجاح"]

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "cellForFourCVCell", bundle: nil), forCellWithReuseIdentifier: "cellForFourCVCell")
    }
    
}
extension CellForTwoTVCell: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellForFourCVCell", for: indexPath) as! cellForFourCVCell
        cell.backImageView.image = images[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
}
extension CellForTwoTVCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.1
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
