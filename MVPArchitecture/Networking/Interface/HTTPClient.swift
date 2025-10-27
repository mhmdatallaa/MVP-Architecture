//
//  Endpoint.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 23/10/2025.
//

import Foundation

protocol HTTPClient {
    func perform<T: Decodable>(_ urlRequest: URLRequest) async throws -> T
}
