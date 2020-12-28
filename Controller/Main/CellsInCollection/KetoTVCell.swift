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
       
        collectionView.register(UINib(nibName: "KetoCVCell", bundle: nil), forCellWithReuseIdentifier: "KetoCVCell")
         HomeCategories()
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
        if indexPath.section == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/887fafdb983d49bbf15a31e07db2a25f.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "جدول الكيتو"
        }
        
        else if indexPath.section == 1 && indexPath.row == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/f46f4f8abe86619e967bfae2ea118f00.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "BMI"
        }
        
        else if indexPath.section == 1 && indexPath.row == 1{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/meals/6496e3792f1c89cda102f93485d296f9.jpeg"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "حاسبة الكيتو"
        }
        
        else if indexPath.section == 2 && indexPath.row == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/adaad9514fb3dcf26a5fdf42da510ae0.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "ألفا كيتو"
        }
        
        else if indexPath.section == 2 && indexPath.row == 1{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/231e938351979207902a3d673a29d184.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "عن الكيتو"
        }
        
        else if indexPath.section == 3{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/462343c8e790a9c31f795f3fb968caec.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "المسموح والممنوع في الكيتو"
        }
        
        else if indexPath.section == 4 && indexPath.row == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/b81e70b6e322fe07a75a1f8c6eb51bc9.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "اسئلة وأجوبة"
        }else{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/0fcdf2a7bbfc177119aa8bccae065b06.png"){
                cell.backImage.af.setImage(withURL: url)
            }
            cell.titleLabel.text = "قصص نجاح"
        }
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
extension KetoTVCell{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            print("hjghj")
        }else{
            print("iii")
        }
    }
}
