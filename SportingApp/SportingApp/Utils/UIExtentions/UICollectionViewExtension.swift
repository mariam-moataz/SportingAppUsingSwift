//
//  UICollectionViewExtension.swift
//  SportingApp
//
//  Created by Mariam Moataz on 14/02/2023.
//

import Foundation
import UIKit

extension UICollectionView{
    func nipConfig(nipname:String, cellIdentifier: String){
        let nib = UINib(nibName: nipname, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func collectionViewConfig(){
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 8
        self.layer.cornerRadius = 20
    }
}
