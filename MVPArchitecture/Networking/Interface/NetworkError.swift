//
//  NetworkingError.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 23/10/2025.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidAPIKey
    case noData
    case decodingFailed
    case serverError(statusCode: Int)
    case unauthorized
    case timeout
    case noInternet
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The request URL is invalid."
        case .noData:
            return "No data was received from the server."
        case .decodingFailed:
            return "Failed to decode the response."
        case .serverError(let statusCode):
            return "Server returned an error (code \(statusCode))."
        case .unauthorized:
            return "You are not authorized. Please log in again."
        case .timeout:
            return "The request timed out. Please try again."
        case .noInternet:
            return "No internet connection. Please check your network."
        case .unknown(let error):
            return "An unknown error occurred: \(error.localizedDescription)"
        case .invalidAPIKey:
            return "Invalid API key."
        }
    }
}
