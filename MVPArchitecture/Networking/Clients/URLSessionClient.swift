//
//  URLSessionClient.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 25/10/2025.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

final class URLSessionClient: HTTPClient {
    private var session: URLSessionProtocol = URLSession.shared
    
    init(session: URLSessionProtocol, configuration: URLSessionConfiguration? = nil) {
        guard let configuration else {
            self.session = session
            return
        }
        self.session = URLSession(configuration: configuration)
    }
    
    func perform<T: Decodable>(_ urlRequest: URLRequest) async throws -> T where T : Decodable {
        let (data, response) = try await session.data(for: urlRequest)
        
        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = httpResponse.statusCode
            switch statusCode {
            case 200:
                Logger.shared.log(">>>>> \(statusCode)")
                break
            case 401: throw NetworkError.invalidAPIKey
            case 404, 422: throw NetworkError.noData
            default: throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            }
        }
        
        return try parseData(data, forType: T.self)
    }
    
    private func parseData<T: Decodable>(_ data: Data, forType type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        do {
            let response =  try decoder.decode(T.self, from: data)
            Logger.shared.log("Response>>>>> \(response)")
            return response
        } catch {
            Logger.shared.log("Error Decodeing data: \(error)", level: .error)
            throw NetworkError.decodingFailed
        }
    }
}

extension URLSession: URLSessionProtocol {
    
}
