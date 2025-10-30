//
//  URLSessionClientTests.swift
//  MVPArchitectureTests
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import XCTest
@testable import MVPArchitecture

//final class URLSessionClientTests: XCTestCase {
//    private var sut: URLSessionClient!
//    private var session: URLSessionSpy!
//    
//    override func setUp() async throws {
//        try await super.setUp()
//        session = URLSessionSpy()
//        sut = await URLSessionClient(session: session)
//    }
//    
//    override func tearDown() async throws {
//        session = nil
//        sut = nil
//        try await super.tearDown()
//    }
//    
//    @MainActor
//    func test_dummy() async throws {
//        let response: MoviesNetwork.Response = try await sut.perform(URLRequest(url: URL(string: "http://Dummy")!))
//        XCTAssertEqual(session.dataForRequestCallCount, 1)
//        XCTAssertEqual(session.requests.first, URLRequest(url: URL(string: "http://DUMMy")!))
//        XCTAssertEqual(session.dataForRequestCallCount, 1)
//        XCTAssertEqual(response.results.count, 4)
//    }
//    
//}
