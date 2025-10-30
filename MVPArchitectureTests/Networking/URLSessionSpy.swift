//
//  URLSessionSpy.swift
//  MVPArchitectureTests
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import Foundation
@testable import MVPArchitecture

class URLSessionSpy: URLSessionProtocol {
    var dataForRequestCallCount = 0
    var requests: [URLRequest] = []
    var returnedDataAndResponse: [(Data?, URLResponse?)] = []
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        dataForRequestCallCount += 1
        requests.append(request)
        let data = PopularMoviesResponseMock.data(using: .utf8)
        let response = response(statusCode: 200)
        returnedDataAndResponse.append((data, response))
        
        
        return (Data(), URLResponse())
    }
    
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMMY")!,
                        statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
}
