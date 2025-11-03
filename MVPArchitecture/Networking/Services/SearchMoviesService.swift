//
//  SearchMoviesService.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 03/11/2025.
//

import Foundation

protocol SearchMoviesServicing {
    typealias MoviesResponse = MoviesNetwork.Response
    
    func fetchMovies(by query: String, at page: Int) async throws -> MoviesResponse
}


struct SearchMoviesService: SearchMoviesServicing {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchMovies(by query: String, at page: Int) async throws -> MoviesResponse {
        let request = try MoviesSearchRequest(queryItems: [
            .init(name: "query", value: query),
            .init(name: "page", value: String(page))
        ]).buildURLRequest()
        let response: MoviesResponse = try await client.perform(request)
        return response
    }
}
