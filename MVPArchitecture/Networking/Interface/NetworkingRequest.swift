//
//  NetworkingRequest.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 23/10/2025.
//

import Foundation

protocol NetworkingRequest {
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
    
    func buildURLRequest() throws -> URLRequest
}

extension NetworkingRequest {
    var method: HTTPMethod { .get }
    var body: Data? { nil }

    func buildURLRequest() throws -> URLRequest {
        guard var components = URLComponents(string: NetworkingConstants.baseURL) else {
            throw NetworkError.unauthorized
        }
        components.queryItems = [
            URLQueryItem(name: "api_key", value: NetworkingConstants.apiKey)
        ]
        if let queryItems {
            components.queryItems?.append(contentsOf: queryItems)
        }
        let baseURL = components.url!
        let pathURL = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: pathURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}

