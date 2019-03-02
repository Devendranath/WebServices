//
//  CommentsViewModel.swift
//  WebServices
//
//  Created by apple on 27/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class CommentsViewModel: NSObject {
    var comments: [Comment]? = []
    func getComments(result: @escaping (Bool)-> Void ) {
        ServiceManager().processGetRequest(endPoint: URLs.comments, params: nil, onSuccess: { (data) in
            
            print("Success, Parse Data")
            do {
                self.comments = try JSONDecoder().decode([Comment].self, from: data)
                
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
