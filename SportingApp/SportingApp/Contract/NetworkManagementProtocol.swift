//
//  NetworkManagementProtocol.swift
//  SportingApp
//
//  Created by Mariam Moataz on 13/02/2023.
//

import Foundation

protocol NetworkManagementProtocol{
    func fetchApi(url: URL?,resonsee : Any? ,
                  handler: @escaping (Any?)->(Void))
}
