//
//  UIImageViewExtension.swift
//  SportingApp
//
//  Created by Mariam Moataz on 14/02/2023.
//

import Foundation
import UIKit

extension UIImageView{
    func imageViewConfig(){
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
}
