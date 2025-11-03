//
//  MovieListPresenter.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import Foundation

final class MovieListPresenter: BasePresenter<MovieListView> {
    enum MovieListPresenterState {
        case popularMovies
        case searchMovies
    }
    
    // MARK: - Poperties
    weak var view: MovieListView!
    
    // MARK: - Private Properties
    private let popularMoviesUseCase: PopularMoviesUseCase
    private let searchMoviesUseCase: SearchMoviesUseCase

    private var currentState: MovieListPresenterState = .popularMovies
    private var movies: [Movie] = []
    private var currentPage = 1
    private var totalPage = 1
    private var query = ""
    
    // MARK: - Init
    init(popularMoviesUseCase: PopularMoviesUseCase, searchMoviesUseCase: SearchMoviesUseCase) {
        self.popularMoviesUseCase = popularMoviesUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        Task {
            await fetchMovies()
        }
    }
    
    // MARK: - Public Methods
    func moviesCount() -> Int {
        movies.count
    }
    
    func movie(at row: Int) -> Movie{
        let movie = movies[row]
        return movie
    }
    
    func search(with query: String, at page: Int = 1) async {
        guard !query.isEmpty else {
            switchToPopularMoviesState()
            return
        }
        
        if currentState == .popularMovies || query != self.query {
            switchToSearchMoviesState(query)
        }
        
        view.startLoading()
        do {
            let (totalPages, movies) = try await searchMoviesUseCase.fetchMovies(by: query, at: page)
            self.totalPage = totalPages
            self.movies = movies
            view.showMovies()
            view.stopLoading()
        } catch {
            Logger.shared.log(error.localizedDescription, level: .error)
            view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
    }
    
    func reachedMovie(at row: Int) {
        let lastFetchedRow = moviesCount() - 1
        guard lastFetchedRow == row else { return }
        guard currentPage < totalPage else { return }
        currentPage += 1
        Task {
            await fetchMovies(at: currentPage)
        }
    }
}


// MARK: - Private Helpers
private extension MovieListPresenter {
    func fetchMovies(at page: Int = 1) async {
        view.startLoading()
        do {
           let (totalPages, resultMovies) = try await popularMoviesUseCase.fetchMovies(at: page)
            movies += resultMovies
            totalPage = totalPages
            view.showMovies()
            view.stopLoading()
        } catch {
            Logger.shared.log(error.localizedDescription, level: .error)
            view.showError(with: "\(type(of: error))", and: error.localizedDescription)
        }
    }
    
    func switchToPopularMoviesState() {
        query = ""
        resetMovies()
        Task { await fetchMovies() }
        currentState = .popularMovies
    }
    
    func switchToSearchMoviesState(_ query: String) {
        self.query = query
        resetMovies()
        currentState = .searchMovies
    }
    
    func resetMovies() {
        currentPage = 1
        movies = []
        view.showMovies()
    }
}
