//
//  MovieListViewController.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

protocol MovieListView: BaseView {
    func showMovies()
}

final class MovieListViewController: BaseViewController<MovieListView, MovieListPresenter> {
    
    // MARK: - Outlets
    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var searchBar: UISearchBar!
    
    // MARK: - Properties
    private lazy var tableViewDataSource = MovieListTableViewDataSource(presenter: presenter)
    private lazy var tableViewDelegate = MovieListTableViewDelegate(presenter: presenter)
    private lazy var searchBarDelegate = MovieListSearchBarDelegate(presenter: presenter)
    
    // MARK: - View Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func setupUI() {
        title = "Movie List"
        setupTableView()
        setupSearchBar()
    }
}

// MARK: - View Protocol
extension MovieListViewController: MovieListView {
    func showMovies() {
        tableView.reloadData()
    }
}

// MARK: - Private helpers
private extension MovieListViewController {
    func setupTableView() {
        tableView.register(cellType: MovieCell.self)
        tableView.keyboardDismissMode = .onDrag
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    func setupSearchBar() {
        searchBar.delegate = searchBarDelegate
        searchBar.placeholder = "Search movie"
    }
}
