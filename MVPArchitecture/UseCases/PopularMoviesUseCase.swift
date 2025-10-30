//
//  PopularMoviesUseCase.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 29/10/2025.
//

import Foundation

final class PopularMoviesUseCase {
    private let networkService: PopularMoviesService
    private let moviesResponseMapper: MoviesResponseMapper
    
    init(networkService: PopularMoviesService, moviesResponseMapper: MoviesResponseMapper) {
        self.networkService = networkService
        self.moviesResponseMapper = moviesResponseMapper
    }
    
    func fetchMovies(at page: Int) async throws -> [Movie] {
        let response = try await networkService.fetchPopularMovies(at: page)
        let movies = moviesResponseMapper.mapResponseToMovies(response)
        
        return movies
    }
}
