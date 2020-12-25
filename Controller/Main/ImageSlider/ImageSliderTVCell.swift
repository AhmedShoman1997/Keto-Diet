//
//  ImageSliderTVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/24/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ImageSliderTVCell: UITableViewCell {

//    let sliders = [#imageLiteral(resourceName: "mask"),#imageLiteral(resourceName: "mask"),#imageLiteral(resourceName: "mask")]
    var titles: [String]?
    var currentIndex = 0
    var timer = Timer()
    var imageSliderModel: SliderImage?
    var dataSlider: [Datum] = []
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageSlider()
        setupUI()
    }
     func imageSlider() {
        let url  = URLs.slider
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .success(_):
                do {
                    guard let data = response.data else { return }
                    self.imageSliderModel = try JSONDecoder().decode(SliderImage.self, from: data)
    
                    self.dataSlider = (self.imageSliderModel?.data)!
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                    
                } catch  {
                    print(error.localizedDescription)
                }
                
            case .failure(_):
                print(response.error?.localizedDescription ?? "")
            }
        }
    }

    func setupUI() {
        collectionView.register(UINib(nibName: "ImageSliderCVCell", bundle: nil), forCellWithReuseIdentifier: "ImageSliderCVCell")
        // dsasd
        pageControl.numberOfPages = 4
        pageControl.currentPage = currentIndex
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(goToNext), userInfo: nil, repeats: true)
    }
    @objc func goToNext() {
        // dsasd
        currentIndex = (currentIndex != 3) ? (currentIndex+1) : 0
        collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentIndex
    }
}

extension ImageSliderTVCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSliderCVCell", for: indexPath) as! ImageSliderCVCell
        cell.titleLabel.text = dataSlider[indexPath.row].mealName
        if let urlForString = URL(string: dataSlider[indexPath.row].image){
            cell.maskImageView.af.setImage(withURL: urlForString)
        }
        
        return cell
    }
    
}
extension ImageSliderTVCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
    
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
}

