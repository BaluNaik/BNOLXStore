//
//  Pagination.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

import Foundation

struct Pagination : Codable {
    let key : String?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
    }

}
