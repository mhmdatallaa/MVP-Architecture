//
//  MovieCell.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

class MovieCell: UITableViewCell {
    static var height: CGFloat = 250
    
    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseYearLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var watchlistImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        posterImageView.layer.cornerRadius = 10
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    // MARK: - Public Methods
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        releaseYearLabel.text = movie.releaseYear
        overviewLabel.text = movie.overview
        posterImageView.setImage(with: movie.posterURL)
        watchlistImageView.image = UIImage(named: movie.isAddedToWatchList ? Resources.Images.heartFilled : Resources.Images.heartEmpty)
    }
}
