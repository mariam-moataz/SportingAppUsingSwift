//
//  UITableViewCellExtension.swift
//  SportingApp
//
//  Created by Mariam Moataz on 14/02/2023.
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
