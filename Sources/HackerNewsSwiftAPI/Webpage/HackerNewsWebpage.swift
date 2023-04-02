import Foundation
import SwiftSoup

/// A representation of a scraped Hacker News stories webpage
internal struct HackerNewsWebpage {
    private let doc: Document
    
    /// Constructs a struct that parses the Hacker News webpage
    /// - Parameter html: HTML String of a Hacker News list of stories
    init(fromHtml html: String) throws {
        self.doc = try SwiftSoup.parse(html)
    }
    
    /// Lists stories from the webpage
    /// - Returns: stories from the webpage
    public func listStories() throws -> [Story] {
        let rows: Elements = try doc.getElementsByClass("athing")
        return try rows.map { try parseStory(fromRow: $0)}
    }
    
    /// Parses a story from a title table row on the webpage
    /// - Parameter row: row to parse
    /// - Returns: story form of the row
    private func parseStory(fromRow row: Element) throws -> Story {
        let id = row.getAttributes()!.get(key: "id")
        let titleLine = try row.getElementsByClass("titleline").first()!
        let title = try titleLine.getElementsByTag("a").first()!.text(trimAndNormaliseWhitespace: true)
        let url = URL(string: try titleLine.getElementsByTag("a").attr("href"))
        
        return Story(id: id, title: title, url: url, author: nil, points: nil, commentCount: nil)
    }
}
