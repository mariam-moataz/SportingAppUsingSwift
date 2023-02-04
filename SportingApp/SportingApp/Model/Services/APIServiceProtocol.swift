//
//  APIServiceProtocol.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation
protocol APIServiceProtocol{
    func fetchApi(endPoint: String, completion: @escaping ((APIResponse?, Error?) -> Void))
}
