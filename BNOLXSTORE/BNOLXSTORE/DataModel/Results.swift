//
//  Results.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

import Foundation

struct ClassifiedData: Codable {
    let createdAt : String?
    let price : String?
    let name : String?
    let uid : String?
    let imageIds : [String]?
    let imageUrls : [String]?
    let thumbnailsUrls : [String]?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price = "price"
        case name = "name"
        case uid = "uid"
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case thumbnailsUrls = "image_urls_thumbnails"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        imageIds = try values.decodeIfPresent([String].self, forKey: .imageIds)
        imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
        thumbnailsUrls = try values.decodeIfPresent([String].self, forKey: .thumbnailsUrls)
    }

}
