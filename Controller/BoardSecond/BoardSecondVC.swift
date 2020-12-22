//
//  BoardSecondVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/14/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BoardSecondVC: UIViewController {
    let questions = ["انت؟","عندك كام سنه؟","وزنك؟","طولك؟"]
    let nums = ["0","1","2","3"]
    var currentIndex = 0
    
   
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonView: UIView!{
        didSet{
            buttonView.layer.cornerRadius = buttonView.frame.height / 2
        }
    }
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 35
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "BoardSecondCVCell", bundle: nil), forCellWithReuseIdentifier: "BoardSecondCVCell")
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        let signUp = SignUpVC()
        signUp.modalPresentationStyle = .fullScreen
        self.present(signUp, animated: true, completion: nil)
    }
}
extension BoardSecondVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardSecondCVCell", for: indexPath) as! BoardSecondCVCell
        
        cell.questionLabel.text = questions[indexPath.row]
        pageControl.numberOfPages = questions.count
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.width)
        pageControl.currentPage = currentIndex
        let vc = BoardSecondCVCell()
        vc.currentIndexPath = currentIndex
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notCenter"), object: nil, userInfo: ["indexPath" : currentIndex])
            }
    
}
extension BoardSecondVC: UICollectionViewDelegateFlowLayout{
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
