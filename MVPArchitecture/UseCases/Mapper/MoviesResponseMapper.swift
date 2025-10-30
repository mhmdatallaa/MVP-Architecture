//
//  MoviesResponseMapper.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 29/10/2025.
//

import Foundation

final class MoviesResponseMapper {
    func mapResponseToMovies(_ response: MoviesNetwork.Response) -> [Movie] {
        response.results.compactMap {
            .init(id: $0.id,
                  title: $0.title,
                  overview: $0.overview,
                  releaseYear: $0.releaseDate?.components(separatedBy: "-").first ?? "0",
                  posterURL: URL(string: NetworkingConstants.imagesBaseURL + ($0.posterPath ?? ""))!,
                  isAddedToWatchList: false)
        }
    }
}
