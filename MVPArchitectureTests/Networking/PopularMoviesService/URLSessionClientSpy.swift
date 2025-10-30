//
//  file.swift
//  MVPArchitectureTests
//
//  Created by Mohamed Atallah on 26/10/2025.
//

import XCTest
@testable import MVPArchitecture


class URLSessionClientSpy: HTTPClient {
    var performCallCount = 0
    var performArgsRequest: [URLRequest] = []
    
    func perform<T>(_ urlRequest: URLRequest) async throws -> T where T : Decodable {
        performCallCount += 1
        performArgsRequest.append(urlRequest)
        return try parseData(PopularMoviesResponseMock, forType: T.self)
    }
    
    private func parseData<T: Decodable>(_ data: String, forType type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        do {
            let d = data.data(using: .utf8) ?? Data()
            let response =  try decoder.decode(T.self, from: d)
            Logger.shared.log("Response>>>>> \(response)")
            return response
        } catch {
            Logger.shared.log("Error Decodeing data: \(error)", level: .error)
            throw NetworkError.decodingFailed
        }
    }

}


