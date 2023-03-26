//
//  Requests.swift
//  BaseApp
//
//  Created by Shirin on 3/26/23.
//

import Foundation

class Requests {
    
    class func getFaq(completionHandler: @escaping (BaseResponse<[Faq]>?)->() ){
        
        Network.perform(url: ApiPath.FAQ,
                        params: Empty(),
                        completionHandler: completionHandler)
    }
}
