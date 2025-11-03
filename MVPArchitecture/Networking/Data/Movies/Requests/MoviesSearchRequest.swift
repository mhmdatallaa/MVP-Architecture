//
//  MoviesSearchRequest.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 03/11/2025.
//

import Foundation

struct MoviesSearchRequest: NetworkingRequest {
    var path: String { NetworkingConstants.searchMovies }
    var headers: [String : String] = [:]
    var queryItems: [URLQueryItem]?
}
