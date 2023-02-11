//
//  APIHandler.swift
//  SportingApp
//
//  Created by Mariam Moataz on 02/02/2023.
//

import Foundation
import Alamofire

 
class APIHandler
{
    
    static let sharedInstance = APIHandler()
    func fetchApi(url: URL?,resonsee : Any? ,
                  handler: @escaping (Any?)->(Void))
    {
        let responsee = resonsee
        guard let newurl = url else{return}
        
        AF.request(newurl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            
            switch response.result{
            case .success(let data):
                switch responsee {
                case is LeagueAPIResponse :
                    let jsonData : LeagueAPIResponse = convertFromJson(data: data!)
                    handler(jsonData)
                case is TeamAPIResponse :
                    let jsonData : TeamAPIResponse = convertFromJson(data: data!)
                    handler(jsonData)
                case is EventAPIResponse :
                    let jsonData : EventAPIResponse = convertFromJson(data: data!)
                    handler(jsonData)
                case is TennisAPIResponse:
                    let jsonData : TennisAPIResponse = convertFromJson(data: data!)
                    handler(jsonData)
                default :
                    print("NO Response")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

