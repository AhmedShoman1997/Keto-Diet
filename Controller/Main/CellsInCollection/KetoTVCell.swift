//
//  KetoTVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/27/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class KetoTVCell: UITableViewCell {
    var width: CGFloat!
    var ketoHomeModel: KetoHome?
    var dataHome:[Datumm] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
       HomeCategories()
        collectionView.register(UINib(nibName: "KetoCVCell", bundle: nil), forCellWithReuseIdentifier: "KetoCVCell")
         
    }
    func HomeCategories() {
        let url = URLs.Home
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .success(_):
                do{
                    guard let data = response.data else { return }
                    self.ketoHomeModel = try JSONDecoder().decode(KetoHome.self, from: data)
                        self.dataHome = (self.ketoHomeModel?.data)!
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            case .failure(_):
                print(response.error?.localizedDescription ?? "")
            }
        }
        
    }
    
}
extension KetoTVCell: UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 3 {
            return 1
        }else{
           return 2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KetoCVCell", for: indexPath) as! KetoCVCell
        Helper.putToCell(section: indexPath.section, row: indexPath.row, cellImage: cell.backImage, cellTitle: &cell.titleLabel)
        return cell
    }
}
extension KetoTVCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 || indexPath.section == 3{
             width = SCREENWIDTH
        }else{
            width = SCREENWIDTH / 2.2
        }
        let height = SCREENHEIGHT / 5
        return CGSize(width: width, height: height)
    }
}
