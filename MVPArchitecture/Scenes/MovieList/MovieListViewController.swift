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
    
    
    // MARK: - View Lifecycle

}

// MARK: - View Protocol



// MARK: - Private helpers
