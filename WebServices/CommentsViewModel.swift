//
//  CommentsViewModel.swift
//  WebServices
//
//  Created by apple on 27/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class CommentsViewModel: NSObject {
    // Parameters
    var comments: [Comment]? = []
    
    // Webservice call
    func getComments(result: @escaping (Bool)-> Void ) {
        ServiceManager().processGetRequest(endPoint: URLs.products, params: nil, onSuccess: { (data) in
            
            print("Success, Parse Data")
            do {
//                self.comments = try JSONDecoder().decode([Comment].self, from: data)
                let response: Response = try JSONDecoder().decode(Response.self, from: data)
                print(response)
                print(response.status)
                print(response.products)
                print(response.products[0].productName)
                print(response.message)
//                self.comments = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                print(self.comments)
                result(true)
            } catch{
                print(error.localizedDescription)
                result(false)
            }
            
            
            
        }) { (errorMessage) in
            print(errorMessage)
            print("Show an alert")
        }
    }
}
