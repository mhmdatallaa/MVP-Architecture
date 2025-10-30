//
//  PopularMoviesServiceTests.swift
//  MVPArchitectureTests
//
//  Created by Mohamed Atallah on 26/10/2025.
//

import XCTest
@testable import MVPArchitecture

final class PopularMoviesServiceTests: XCTestCase {
    private var sut: PopularMoviesService!
    private var urlSessionClientSpy: URLSessionClientSpy!
    
    override func setUp() async throws {
        try await super.setUp()
        urlSessionClientSpy = URLSessionClientSpy()
        sut = await PopularMoviesService(client: urlSessionClientSpy)
    }
    
    override func tearDown() async throws {
        sut = nil
        urlSessionClientSpy = nil
        try await super.tearDown()
    }
    
    @MainActor
    func test_popularMoviesServicePerformTask_shouldCallOneTime() async throws {
        let response: MoviesNetwork.Response = try await sut.fetchPopularMovies(at: 1)
        
        XCTAssertEqual(urlSessionClientSpy.performCallCount, 1)
        XCTAssertEqual(urlSessionClientSpy.performArgsRequest.first, URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=360fea79b52f0de605753ec67513d039&page=1")!))
        XCTAssertEqual(response.page, 1)
//        response.results.count
//        response.totalResults
    }
}
