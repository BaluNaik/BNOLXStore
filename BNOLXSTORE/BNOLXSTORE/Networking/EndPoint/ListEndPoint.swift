//
//  ListEndPoint.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import Foundation

public enum ListApi {
    case getlist
}

extension ListApi: EndPointType {
    
    var requestURL: URL {
        guard let url = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer") else {
            fatalError("url could not be configured.")
        }
        
        return url
    }
    
    var httpMethod: HTTPMethod { return .get}
    
}
