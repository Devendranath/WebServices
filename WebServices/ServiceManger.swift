//
//  ServiceManger.swift
//  WebServices
//
//  Created by apple on 27/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import Foundation

class ServiceManager {
    
    func processGetRequest(endPoint: String, params: [String: String]?, onSuccess: @escaping ((Data) -> Void), onFailure: @escaping (String) -> Void) {
        // Step 1: Prepare URLRequest
        let finalEndpoint = URLs.baseURL + endPoint
        print(finalEndpoint)
        let finalURL = URL(string: finalEndpoint)!
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = "GET"
//        urlRequest.httpBody = Data()
        
        
        //2:  Connect to the web server URLSession/ Alomafire
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            print("Get Request processed!")
            
            guard error == nil else {
                onFailure(error.debugDescription)
                return
            }
            
            if let data = data {
                onSuccess(data)
            }
            print(response)
            print(data)
        }
        
        dataTask.resume()
    }
    
}
