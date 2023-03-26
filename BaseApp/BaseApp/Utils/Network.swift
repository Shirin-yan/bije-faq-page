//
//  Network.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import Foundation
import Alamofire

class Network {
    
    class func perform<T:Decodable, Parameter: Encodable> (
        url: String,
        method: HTTPMethod = .get,
        params: Parameter,
        encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
        headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc5OTI0NjIxLCJpYXQiOjE2Nzk4MzQ2MjEsImp0aSI6IjE2NzM0MThmOTJjMzQ0NzBhODM5MWZlYTMyNmYxZmE1IiwidXNlcl9pZCI6Mjd9.gtNLUZ1g73foLyNbOZzRP9GKnRmB40jAm1V87emcU14"
        ],
        
        completionHandler: @escaping (BaseResponse<T>?)->() ){
           AF.request(url,
                      method: method,
                      parameters: params,
                      encoder: encoder,
                      headers: headers)
           .responseDecodable(of: BaseResponse<T>.self) { resp in

//               debugPrint(resp)
               
            guard let value = resp.value else {
                completionHandler(nil)
                return
            }

               
            completionHandler(value)
        }
    }
}
