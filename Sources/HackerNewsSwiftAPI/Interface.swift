import Foundation

/// A Hacker News Story
public struct Story: Equatable {
    public init(id: String, title: String, url: URL?, author: Username?, points: Int?, commentCount: Int?, text: String?) {
        self.id = id
        self.title = title
        self.url = url
        self.author = author
        self.points = points
        self.commentCount = commentCount
        self.text = text
    }
    
    public let id: ItemId
    public let title: String
    public let url: URL?
    public let author: Username?
    public let points: Int?
    public let commentCount: Int?
    public let text: String?
}

public typealias Username = String

public typealias ItemId = String
