//
//  UIExtensions.swift
//  SportingApp
//
//  Created by Mariam Moataz on 11/02/2023.
//

import Foundation
import UIKit

extension UITableViewCell{
    func cellframe()
    {
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 6
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
}

extension UITableView{
    func nipConfig(nipname:String, cellIdentifier: String){
        let nib = UINib(nibName: nipname, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}

extension UICollectionView{
    func nipConfig(nipname:String, cellIdentifier: String){
        let nib = UINib(nibName: nipname, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
}
