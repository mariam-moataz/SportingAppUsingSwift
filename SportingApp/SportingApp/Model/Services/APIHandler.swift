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
    func fetchApi(endPoint: String, res : Any, handler: @escaping (APIResponse?)->(Void))
    {
        //https://allsportsapi.com/admin/
        guard let url = URL(string: URLService(endPoint: endPoint).url) else{return}
    
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result{
            case .success(let data):
                do{
                    //let jsonData = try JSONDecoder().decode(APIResponse.self, from: data!)
                    //let decodedArray:[User] = convertFromJson(data: data) ?? []
                    let jsonData : APIResponse = convertFromJson(data: data!) as! APIResponse
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

