//
//  APIHandler.swift
//  SportingApp
//
//  Created by Mariam Moataz on 02/02/2023.
//

import Foundation
import Alamofire


/*
 func fetchResult(url : String,complitionHandler: @escaping ([Item]?,Error?)  -> Void){
     
     // 1-
     let url2 = URL(string: url)
     guard let newUrl = url2 else{
         return
     }
     // 2-
     let request = URLRequest(url: newUrl)
     // 3-
     let session = URLSession(configuration: .default)
     // 4-
     let task = session.dataTask(with: request) { (data, response, error) in
         // 6-
         guard let data = data else{
             complitionHandler(nil, nil)
             return
 */
 
class APIHandler
{
 static let sharedInstance = APIHandler()
    func fetchApi(url: URL?, handler: @escaping(_ leagueData:[League])->(Void))
    {
        let url = URL(string: "https://allsportsapi.com/admin/")
        guard let newURL = url else{return}
    
        AF.request(newURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { rresponse in
            switch rresponse.result{
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode([League].self, from: data!)
                    handler(jsonData)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

extension URLSession{
    
    enum CustomError: Error{
        case invalidURL
        case invalidData
    }
    
    func request <T:Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T,Error>)->Void){
        guard let url = url else{
            completion(.failure(CustomError.invalidURL))
            return
        }
        //Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion
        let task = dataTask(with: url) {data, response, error in
            guard let data = data else{
                if let error = error{
                    completion(.failure(error))
                }
                else{
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do{
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

