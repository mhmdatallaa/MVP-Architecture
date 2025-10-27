//
//  HTTPMethod.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 23/10/2025.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET" // Retrieve Data.
    case post = "POST" // Create a new resource.
    case put = "PUT" // Replace a resource entirly.
    case patch = "PATCH" // Partially update a resource.
    case delete = "DELETE" // Remove a resource.
}
