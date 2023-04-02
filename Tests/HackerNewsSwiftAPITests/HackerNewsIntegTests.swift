//
//  HackerNewsIntegTests.swift
//  
//
//  Created by Hayden Hong on 4/2/23.
//

import Foundation
import XCTest
@testable import HackerNewsSwiftAPI

/// Basic test to verify that stories can be loaded
class HackerNewsIntegTests: XCTestCase {
    private var hackerNews: HackerNews! = nil
    
    override func setUp() {
        self.hackerNews = HackerNews()
        // Stupid solution to prevent throttling from the Hacker News website, just sleep before testing
        sleep(1)
    }
    
    override func tearDown() {
        self.hackerNews = nil
    }
    
    func testNews() async throws {
        let stories = try await hackerNews.list(.news, forPage: 1)
        XCTAssertEqual(stories.count, 30)
    }
    
    func testNewsPage2() async throws {
        let stories = try await hackerNews.list(.news, forPage: 2)
        XCTAssertEqual(stories.count, 30)
    }
    
    func testFront() async throws {
        let stories = try await hackerNews.list(.front, forPage: 1)
        XCTAssertEqual(stories.count, 30)
    }
    
    func testAsk() async throws {
        let stories = try await hackerNews.list(.ask, forPage: 1)
        XCTAssertEqual(stories.count, 30)
    }
    
    func testJobs() async throws {
        let stories = try await hackerNews.list(.jobs, forPage: 1)
        XCTAssertEqual(stories.count, 30)
    }
    
    func testNewest() async throws {
        let stories = try await hackerNews.list(.newest, forPage: 1)
        XCTAssertEqual(stories.count, 30)
    }
    
    func testShow() async throws {
        let stories = try await hackerNews.list(.show, forPage: 1)
        XCTAssertEqual(stories.count, 30)
    }
}
