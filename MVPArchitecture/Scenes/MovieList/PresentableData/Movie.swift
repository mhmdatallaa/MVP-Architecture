//
//  Movie.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import Foundation

struct Movie: Equatable {
    let id: Int
    let title: String
    let overview: String
    let releaseYear: String
    let posterURL: URL
    var isAddedToWatchList: Bool
}
