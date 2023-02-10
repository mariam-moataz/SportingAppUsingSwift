//
//  DateConverter.swift
//  SportingApp
//
//  Created by Mariam Moataz on 10/02/2023.
//

import Foundation

protocol DateConverterProtocol{
    func dateFormater(date:Date) -> String
}

class DateConverter2 : DateConverterProtocol{
    
    func dateFormater(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
}
