//
//  BoardSecondCVCell.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/14/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BoardSecondCVCell: UICollectionViewCell {
    
    var age = [String]()
    var weight = [String]()
    var height = [String]()
    var rotationAngle: CGFloat!
    var currentIndexPath: Int!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerViewSetUp()
        fillArray()
    }
    func pickerViewSetUp()  {
        rotationAngle = -90 * (.pi / 180)
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
    
    }
    func fillArray() {
        for i in 18 ... 158{
            age.append("\(i)")
        }
        for i in 40...180{
            weight.append("\(i)")
        }
        for i in 140...280{
            height.append("\(i)")
        }
    }
}
extension BoardSecondCVCell: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return age.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         if currentIndexPath == 1{
            return age[row]
        }else if currentIndexPath == 2{
            return weight[row]
        }else{
            return height[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.textAlignment = .center
        
         if currentIndexPath == 1{
           label.text = age[row]
        }else if currentIndexPath == 2{
            label.text = weight[row]
        }else{
            label.text = height[row]
        }

        label.text = age[row]
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180))
        
        return view
        }
}
