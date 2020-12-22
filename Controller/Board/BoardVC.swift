//
//  BoardVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/13/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BoardVC: UIViewController {
    let titles = ["معلومة ١ عن الابلكيشن","معلومة ٢ عن الابلكيشن","معلومة ٣ عن الابلكيشن"]
    var currentIndex = 0

    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 35
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var skipButton: UIView!{
        didSet{
            skipButton.layer.cornerRadius = skipButton.frame.height / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        let vc = BoardSecondVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    func setUpUi()  {
        collectionView.register(UINib(nibName: "BoardCVC", bundle: nil), forCellWithReuseIdentifier: "BoardCVC")
        pageControl.numberOfPages = titles.count
    }

}

extension BoardVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCVC", for: indexPath) as! BoardCVC
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.width)
        pageControl.currentPage = currentIndex
    }
    
    
}
extension BoardVC: UICollectionViewDelegateFlowLayout{
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

    
    
}
