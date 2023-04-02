import Foundation

/// A Hacker News Story
public struct Story: Equatable {
    internal init(id: String, title: String, url: URL?, author: Username?, points: Int?, commentCount: Int?) {
        self.id = id
        self.title = title
        self.url = url
        self.author = author
        self.points = points
        self.commentCount = commentCount
    }
    
    public let id: String
    public let title: String
    public let url: URL?
    public let author: Username?
    public let points: Int?
    public let commentCount: Int?
}

public typealias Username = String

public typealias ItemId = Int
