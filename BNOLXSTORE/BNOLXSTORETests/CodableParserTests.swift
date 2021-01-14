//
//  CodableParserTests.swift
//  BNOLXSTORETests
//
//  Created by Balu Naik on 1/12/21.
//

import XCTest

class CodableParserTests: BNOLXSTORETests {
    
    func testCodableParser() {
        let response = CodableParser.parseResponse(nil, type: String.self)
        XCTAssertNil(response, "Could not parse response")
    }
    
    func testValidCodeableParser() {
        let dataObject = self.getResponseData()
        let classifiedObject = CodableParser.parseResponse(dataObject, type: Classified.self)
        XCTAssertNotNil(classifiedObject, "Response must be parse")
        
        XCTAssertEqual(classifiedObject?.results?.count, 2, "Result must be have 2 elements")
    }
    
    func getResponseData() -> Data {
        let dataString = """
    {
    "results": [
    {
    "created_at": "2019-02-24 04:04:17.566515",
    "price": "AED 5",
    "name": "Notebook",
    "uid": "4878bf592579410fba52941d00b62f94",
    "image_ids": [
    "9355183956e3445e89735d877b798689"
    ],
    "image_urls": [
    "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4YU2R66S7&Signature=OjRsc6LLEpCcqLX7TGeE9iw7%2FtM%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBwaCXVzLWVhc3QtMSJIMEYCIQD%2FUUjlmQepf%2BatCMTGuPhgMIikQj8sg1dIZukFxt7LugIhANKZMRRN5ZV5AlC3hFIr6PDjEtceJK7AHgQk%2FHZcWXfQKtcBCOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQAhoMMTg0Mzk4OTY2ODQxIgzU4DqpLNKOP4dkpKMqqwEsfQ9NwuX4%2B4DWWuWfUvWbOd8SzOqBsTCOnP3Ctz7T5%2FYlHsItXYrd%2F7I6vXm1yehyamoXnfSiXZOojRezatA2B%2BhGYwFNXTP3YOd9qb1yFZviul4vvP8C6IliKDBGFfSbWSlj%2B7lp5fuFlUZ9lYaRY1ZmCjpc4nORscx7HynWGgSn7JK7%2BxV73PWI8yIU4fYt8srzSBoh04wa3ep%2BAPhsjUGwN8V2UJlq7W4wwfL%2B%2FwU63wGnlY2FGUBOW8GL8i9rPTKWdkFdrk54FQBCK9rkW2KHXKALxhuck8wHNBQFTAuo%2FVEqu0Ss1tTg3PnIXu4GAAIdOfFMfABzdfuEfdRH0fr0KlSiSe%2BGg59GYlNE5HUpBzT%2FRe3BSwrKnM2CXGFk3NpnDZpjFxTLb7IFyW%2FH4FwGtrQh9ggHr1IQ1Z%2BcERo6VfIjeiuSngGEBViPfNsXu5XfCZJ9Ez57rxf3lsrxgdlegAa7yhzh9oo%2FbmndsjFzssiU39zIl5xP%2FQ6cKNu0Au6DxPISh22NhLQnpeEHvb3P&Expires=1610599152"
    ],
    "image_urls_thumbnails": [
    "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4YU2R66S7&Signature=8sk8qyBfF%2BQRQBvj1Vsd2K8XzVY%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBwaCXVzLWVhc3QtMSJIMEYCIQD%2FUUjlmQepf%2BatCMTGuPhgMIikQj8sg1dIZukFxt7LugIhANKZMRRN5ZV5AlC3hFIr6PDjEtceJK7AHgQk%2FHZcWXfQKtcBCOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQAhoMMTg0Mzk4OTY2ODQxIgzU4DqpLNKOP4dkpKMqqwEsfQ9NwuX4%2B4DWWuWfUvWbOd8SzOqBsTCOnP3Ctz7T5%2FYlHsItXYrd%2F7I6vXm1yehyamoXnfSiXZOojRezatA2B%2BhGYwFNXTP3YOd9qb1yFZviul4vvP8C6IliKDBGFfSbWSlj%2B7lp5fuFlUZ9lYaRY1ZmCjpc4nORscx7HynWGgSn7JK7%2BxV73PWI8yIU4fYt8srzSBoh04wa3ep%2BAPhsjUGwN8V2UJlq7W4wwfL%2B%2FwU63wGnlY2FGUBOW8GL8i9rPTKWdkFdrk54FQBCK9rkW2KHXKALxhuck8wHNBQFTAuo%2FVEqu0Ss1tTg3PnIXu4GAAIdOfFMfABzdfuEfdRH0fr0KlSiSe%2BGg59GYlNE5HUpBzT%2FRe3BSwrKnM2CXGFk3NpnDZpjFxTLb7IFyW%2FH4FwGtrQh9ggHr1IQ1Z%2BcERo6VfIjeiuSngGEBViPfNsXu5XfCZJ9Ez57rxf3lsrxgdlegAa7yhzh9oo%2FbmndsjFzssiU39zIl5xP%2FQ6cKNu0Au6DxPISh22NhLQnpeEHvb3P&Expires=1610599152"
    ]
    },
    {
    "created_at": "2019-02-23 07:56:26.686128",
    "price": "AED 500",
    "name": "Glasses",
    "uid": "bdf455e89f3b49f484d2a181b0268eab",
    "image_ids": [
    "46a0c97762ba449cb49b3575681a4d84"
    ],
    "image_urls": [
    "https://demo-app-photos-45687895456123.s3.amazonaws.com/46a0c97762ba449cb49b3575681a4d84?AWSAccessKeyId=ASIASV3YI6A4YU2R66S7&Signature=oWlV1ArqxZuUgYlU1xdeE%2BVoPpQ%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBwaCXVzLWVhc3QtMSJIMEYCIQD%2FUUjlmQepf%2BatCMTGuPhgMIikQj8sg1dIZukFxt7LugIhANKZMRRN5ZV5AlC3hFIr6PDjEtceJK7AHgQk%2FHZcWXfQKtcBCOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQAhoMMTg0Mzk4OTY2ODQxIgzU4DqpLNKOP4dkpKMqqwEsfQ9NwuX4%2B4DWWuWfUvWbOd8SzOqBsTCOnP3Ctz7T5%2FYlHsItXYrd%2F7I6vXm1yehyamoXnfSiXZOojRezatA2B%2BhGYwFNXTP3YOd9qb1yFZviul4vvP8C6IliKDBGFfSbWSlj%2B7lp5fuFlUZ9lYaRY1ZmCjpc4nORscx7HynWGgSn7JK7%2BxV73PWI8yIU4fYt8srzSBoh04wa3ep%2BAPhsjUGwN8V2UJlq7W4wwfL%2B%2FwU63wGnlY2FGUBOW8GL8i9rPTKWdkFdrk54FQBCK9rkW2KHXKALxhuck8wHNBQFTAuo%2FVEqu0Ss1tTg3PnIXu4GAAIdOfFMfABzdfuEfdRH0fr0KlSiSe%2BGg59GYlNE5HUpBzT%2FRe3BSwrKnM2CXGFk3NpnDZpjFxTLb7IFyW%2FH4FwGtrQh9ggHr1IQ1Z%2BcERo6VfIjeiuSngGEBViPfNsXu5XfCZJ9Ez57rxf3lsrxgdlegAa7yhzh9oo%2FbmndsjFzssiU39zIl5xP%2FQ6cKNu0Au6DxPISh22NhLQnpeEHvb3P&Expires=1610599152"
    ],
    "image_urls_thumbnails": [
    "https://demo-app-photos-45687895456123.s3.amazonaws.com/46a0c97762ba449cb49b3575681a4d84-thumbnail?AWSAccessKeyId=ASIASV3YI6A4YU2R66S7&Signature=CPMYPC7Bmf0r56cf7cGximShr2s%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEBwaCXVzLWVhc3QtMSJIMEYCIQD%2FUUjlmQepf%2BatCMTGuPhgMIikQj8sg1dIZukFxt7LugIhANKZMRRN5ZV5AlC3hFIr6PDjEtceJK7AHgQk%2FHZcWXfQKtcBCOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQAhoMMTg0Mzk4OTY2ODQxIgzU4DqpLNKOP4dkpKMqqwEsfQ9NwuX4%2B4DWWuWfUvWbOd8SzOqBsTCOnP3Ctz7T5%2FYlHsItXYrd%2F7I6vXm1yehyamoXnfSiXZOojRezatA2B%2BhGYwFNXTP3YOd9qb1yFZviul4vvP8C6IliKDBGFfSbWSlj%2B7lp5fuFlUZ9lYaRY1ZmCjpc4nORscx7HynWGgSn7JK7%2BxV73PWI8yIU4fYt8srzSBoh04wa3ep%2BAPhsjUGwN8V2UJlq7W4wwfL%2B%2FwU63wGnlY2FGUBOW8GL8i9rPTKWdkFdrk54FQBCK9rkW2KHXKALxhuck8wHNBQFTAuo%2FVEqu0Ss1tTg3PnIXu4GAAIdOfFMfABzdfuEfdRH0fr0KlSiSe%2BGg59GYlNE5HUpBzT%2FRe3BSwrKnM2CXGFk3NpnDZpjFxTLb7IFyW%2FH4FwGtrQh9ggHr1IQ1Z%2BcERo6VfIjeiuSngGEBViPfNsXu5XfCZJ9Ez57rxf3lsrxgdlegAa7yhzh9oo%2FbmndsjFzssiU39zIl5xP%2FQ6cKNu0Au6DxPISh22NhLQnpeEHvb3P&Expires=1610599152"
    ]
    }
    ],
    "pagination": {
    "key": null
    }
    }
    """
        return Data(dataString.utf8)
    }
    
}
