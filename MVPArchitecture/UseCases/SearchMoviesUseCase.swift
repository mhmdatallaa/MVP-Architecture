//
//  SearchMoviesUseCase.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 03/11/2025.
//

import Foundation

final class SearchMoviesUseCase {
    private let networkService: SearchMoviesServicing
    private let moviesResponseMapper: MoviesResponseMapper
    
    init(networkService: SearchMoviesServicing, MoviesResponseMapper: MoviesResponseMapper) {
        self.networkService = networkService
        self.moviesResponseMapper = MoviesResponseMapper
    }
    
    func fetchMovies(by query: String, at page: Int) async throws -> (totalPages: Int, movies: [Movie]) {
        let response = try await networkService.fetchMovies(by: query, at: page)
        let movies = moviesResponseMapper.mapResponseToMovies(response)
        return (response.totalPages, movies)
    }
}
