//
//  NetworkingService.swift
//  cdaX
//
//  Created by Emilio Castro on 2/7/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//
//
//  NetworkingService.swift
//  cda2
//
//  Created by Emilio Castro on 1/9/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation

enum MyResult <T, E: Error> {
    case success(T)
    case failure(E)
}

class NetworkingService {
    let baseUrl = "http://ecastro-001-site1.atempurl.com/token"
    func request(endpoint: String, parameters: [String: Any], completion: @escaping (Result<User, Error>) -> Void){
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        var request = URLRequest(url: url)
        var components = URLComponents()
        var queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: String(describing: value))
            queryItems.append(queryItem)
        }
        components.queryItems = queryItems
        let queryItemData  = components.query?.data(using: .utf8)
        request.httpBody = queryItemData
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.sync {
              
            
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                print(unwrappedResponse)
                
                switch unwrappedResponse.statusCode {
                case 200 ..< 300:
                    print("Exito")
                default:
                        print("Fallo ERROR")
                }
                
                if let unwrappedError = error {
                    completion(.failure(unwrappedError))
                    return
                }
                
                if let unwrappedData = data {
                    do {
                       // let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                      // print (json)
                        
                        if let user = try? JSONDecoder().decode(User.self, from: unwrappedData){
                            completion(.success(user))
                        }else {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            completion(.failure(errorResponse))
                        }
                    }catch{
                        completion(.failure(error))
                    }
                }
            }
            
        }
        task.resume()
    }
    
}

enum NetworkingError: Error {
    case badUrl
    case badResponse
}
