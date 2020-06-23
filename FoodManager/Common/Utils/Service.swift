//
//  Service.swift
//  FoodManager
//
//  Created by Shawn Li on 6/18/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation

class Service
{
 
    static var `shared` = Service()

    private init(){}
    
    func fetchData(url: String, handler: @escaping (Data?) -> ())
    {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = AppConstants.headers
    
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        { (data, response, error) in
            if let data = data
            {
                handler(data)
            }
            else
            {
                handler(nil)
            }
        }
        task.resume()
    }
}
