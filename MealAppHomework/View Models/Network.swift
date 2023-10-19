//
//  Network.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import Foundation


class Network {
    
    private static let session = URLSession.shared
    
   
    static func request<T:Codable>(request : URLRequest,expectedType : T.Type,completionHandler : @escaping (Result<T,Error>) -> Void){
        session.dataTask(with: request) { data, _, err in
            if err != nil {
                completionHandler(.failure(err!))
            }
            
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(result))
            }catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}
