import Foundation
import Moya

/// Target for web scraping the Hacker News webpage
enum HackerNewsWebpageTarget {
    case listStories(_: Page, forPage: Int)
}

extension HackerNewsWebpageTarget: TargetType {
    var baseURL: URL {
        switch self {
        case .listStories(_, _):
            return URL(string: "https://news.ycombinator.com/")!
        }
    }
    
    var path: String {
        switch self {
        case let .listStories(page, _):
            return page.rawValue
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case let .listStories(_, pageNumber):
            return .requestParameters(parameters: ["p": pageNumber], encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

/// The different story list pages on Hacker News
public enum Page: String {
    case news
    case newest
    case front
    case jobs
    case show
    case ask
}
