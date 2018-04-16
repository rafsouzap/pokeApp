//
//  ServiceManager.swift
//  pokeApp
//
//  Created by Rafael de Paula on 11/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class ServiceManager {
    
    static let shared = ServiceManager()
    
    func request(url: String, method: RequestMethod, parameters: [String : Any]?, success: @escaping (Data) -> Void, failure: @escaping (ServiceError) -> Void) {
        
        guard let _url = URL(string: url) else {
            failure(ServiceError.invalidUrl)
            return
        }
        
        var request = URLRequest(url: _url)
        request.httpMethod = method.value
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jsonBody = parameters {
            if let httpBody = try? JSONSerialization.data(withJSONObject: jsonBody) {
                request.httpBody = httpBody
            }
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse else {
                    failure(ServiceError.invalidResponse)
                    return
                }
                
                guard 200...300 ~= response.statusCode else {
                    failure(ServiceError(code: response.statusCode))
                    return
                }
                
                guard let data = data else {
                    failure(ServiceError.notMapped)
                    return
                }
                
                //let jsonBody = String(data: data, encoding: .utf8)!
                success(data)
            }
        }
        task.resume()
    }
}
