//
//  UITableViewExtension.swift
//  SportingApp
//
//  Created by Mariam Moataz on 14/02/2023.
//

import Foundation
import UIKit

extension UITableView{
    func nipConfig(nipname:String, cellIdentifier: String){
        let nib = UINib(nibName: nipname, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}
