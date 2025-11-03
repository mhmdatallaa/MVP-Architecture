//
//  DependencyFactory.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import Foundation

protocol Factory {
    func makeMovieListViewController(_ coordinator: MovieListCoordinator) -> MovieListViewController
}

final class DependencyFactory: Factory {
    private let urlSessionClient = URLSessionClient(session: URLSession.shared)
    private let moviesResponseMapper = MoviesResponseMapper()
    
    func makeMovieListViewController(_ coordinator: MovieListCoordinator) -> MovieListViewController {
        
        let popularMoviesService = PopularMoviesService(client: urlSessionClient)
        let popularMovieUseCase = PopularMoviesUseCase(networkService: popularMoviesService, moviesResponseMapper: moviesResponseMapper)
        
        let searchMoviesService = SearchMoviesService(client: urlSessionClient)
        let searchMoviesUseCase = SearchMoviesUseCase(networkService: searchMoviesService, MoviesResponseMapper: moviesResponseMapper)
        
        let presenter = MovieListPresenter(popularMoviesUseCase: popularMovieUseCase, searchMoviesUseCase: searchMoviesUseCase)
        
        let movieListViewController = MovieListViewController(presenter: presenter)
        
        presenter.view = movieListViewController
        
        return movieListViewController
    }
}
