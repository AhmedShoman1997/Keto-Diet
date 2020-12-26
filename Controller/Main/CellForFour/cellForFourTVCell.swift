//
//  cellForFourTVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/26/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class cellForFourTVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let images = [#imageLiteral(resourceName: "mask"),#imageLiteral(resourceName: "bitmap-1"),#imageLiteral(resourceName: "mask-1"),#imageLiteral(resourceName: "bitmap")]
    let titles = ["BMI","ألفا كيتو","حاسبة السعرات","عن الكيتو"]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "cellForFourCVCell", bundle: nil), forCellWithReuseIdentifier: "cellForFourCVCell")
        
    }
}
extension cellForFourTVCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellForFourCVCell", for: indexPath) as! cellForFourCVCell
        cell.backImageView.image = images[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    
    
}
extension cellForFourTVCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.1
        let height = collectionView.frame.height / 2.1
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
