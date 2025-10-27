//
//  PopularMoviesService.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 26/10/2025.
//

import Foundation

protocol PopularMoviesServicing {
    typealias MoviesResponse = MoviesNetwork.Response
    func fetchPopularMovies(at page: Int) async throws -> MoviesResponse
}

class PopularMoviesService: PopularMoviesServicing {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchPopularMovies(at page: Int) async throws -> MoviesResponse {
        let request = try PopularMoviesRequest(queryItems: [
            .init(name: "page", value: String(page))
        ]).buildURLRequest()
        
        let popularMoviesResponse: MoviesResponse = try await client.perform(request)
        
        return popularMoviesResponse
    }
}
