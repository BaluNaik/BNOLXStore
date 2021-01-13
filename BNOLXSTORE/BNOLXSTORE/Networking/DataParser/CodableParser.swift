//
//  CodableParser.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import Foundation

class CodableParser: NSObject {
    
    class func parseResponse<T: Decodable>(_ response: Data?, type: T.Type) -> T? {
        guard let responseData = response else { return nil }
        let jsonDecoder = JSONDecoder()
        let responseModel = try? jsonDecoder.decode(T.self, from: responseData)
        
        return responseModel
    }
    
}
