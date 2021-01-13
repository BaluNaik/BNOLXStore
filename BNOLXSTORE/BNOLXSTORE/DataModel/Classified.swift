//
//  Classified.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

import Foundation

struct Classified: Codable {
    let results: [ClassifiedData]?
    let pagination: Pagination?

    enum CodingKeys: String, CodingKey {
        case results = "results"
        case pagination = "pagination"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([ClassifiedData].self, forKey: .results)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}
