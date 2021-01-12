//
//  CodableParser.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import Foundation

class CodableParser: NSObject {
    
    class func parseResponse<T: Decodable>(_ response: Any?, type: T.Type) -> T? {
        guard let responseData = response else { return nil }
        var decodedData: T? = nil
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: responseData, options: .prettyPrinted)
            do {
                decodedData = try JSONDecoder().decode(T.self, from: jsonData)
            } catch { }
        } catch { }
        
        return decodedData
    }
    
}
