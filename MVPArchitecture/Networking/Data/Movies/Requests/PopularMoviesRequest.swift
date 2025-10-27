//
//  PopularMoviesRequest.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 26/10/2025.
//

import Foundation

struct PopularMoviesRequest: NetworkingRequest {
    var path: String { NetworkingConstants.popularMovies }
    var headers: [String : String] = [:]
    var queryItems: [URLQueryItem]?   
}
