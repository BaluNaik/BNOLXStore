//
//  NetworkingManager.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ error: String?)->()

enum NetworkResponse:String {
    case success
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}


class NetworkingManager {
    
    private let session: URLSession?
    private var task: URLSessionTask?
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request(_ endPoint: EndPointType , completion: @escaping NetworkRouterCompletion) {
        let session = self.session ?? URLSession.shared
        do {
            let request = try self.buildRequest(from: endPoint)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        completion(responseData, nil)
                    case .failure(let networkFailureError):
                        completion(nil, networkFailureError)
                    }
                }
            })
        } catch {
            completion(nil, "Request can't be perform")
        }
        self.task?.resume()
    }
    
    fileprivate func buildRequest(from route: EndPointType) throws -> URLRequest {
        var request = URLRequest(url: route.requestURL,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        
        return request
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}
