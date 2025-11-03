//
//  MovieListTableViewDelegate.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 31/10/2025.
//

import UIKit

final class MovieListTableViewDelegate: NSObject {
    let presenter: MovieListPresenter
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
}

extension MovieListTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.reachedMovie(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        MovieCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle row selcetion
    }
}
