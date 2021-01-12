//
//  EndPointType.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import Foundation

protocol EndPointType {
    var requestURL: URL { get }
    var httpMethod: HTTPMethod { get }
}
