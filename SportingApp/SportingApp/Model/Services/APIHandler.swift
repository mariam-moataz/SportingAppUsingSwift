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
        //https://allsportsapi.com/admin/
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
                default :
                    print("NO Response")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

/*extension URLSession{
    
    enum CustomError: Error{
        case invalidURL
        case invalidData
    }
    
    func request <T:Decodable>(endPoint: String, expecting: T.Type, handler: @escaping (APIResponse<T>)->Void){
        guard let url = URL(string: URLService(endPoint: endPoint).url) else{
            //handler(.failure(CustomError.invalidURL))
            return
        }
        //Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion
        let task = dataTask(with: url) {data, response, error in
            guard let data = data else{
                /*if let error = error{
                    handler(.failure(error))
                }
                else{
                    handler(.failure(CustomError.invalidData))
                }*/
                return
            }
            do{
                let result = try JSONDecoder().decode(expecting, from: data)
                handler(result as! APIResponse<T>)
            }
            catch let error{
                //handler(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
}*/

