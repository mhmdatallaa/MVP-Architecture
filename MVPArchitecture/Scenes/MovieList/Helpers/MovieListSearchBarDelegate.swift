//
//  MovieListSearchBarDelegate.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 03/11/2025.
//

import UIKit


final class MovieListSearchBarDelegate: NSObject {
    // MARK: - Properties
    private let presenter: MovieListPresenter
    private let depouncer = Depouncer(delay: 0.3)
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
}

extension MovieListSearchBarDelegate: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        Task {
            await presenter.search(with: searchBar.text ?? "")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        depouncer.run { [weak self] in
            Task {
                await self?.presenter.search(with: searchBar.text ?? "")
            }
            if searchText.isEmpty {
                searchBar.resignFirstResponder()
            }
        }
    }
}
