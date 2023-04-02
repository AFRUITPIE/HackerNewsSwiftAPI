import Moya

/// Accessor for Hacker News stories
public struct HackerNews {
    private var webpage: MoyaProvider<HackerNewsWebpageTarget>

    public init() {
        webpage = MoyaProvider<HackerNewsWebpageTarget>()
    }
    
    public func list(_ page: Page, forPage pageNumber: Int) async throws -> [Story] {
        try await withCheckedThrowingContinuation { continuation in
            webpage.request(.listStories(page, forPage: pageNumber)) { result in
                switch result {
                case let .success(response):
                    do {
                        let html = try response.mapString()
                        let webpage = try HackerNewsWebpage(fromHtml: html)
                        let stories = try webpage.listStories()
                        continuation.resume(with: Result.success(stories))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
