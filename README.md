# Hacker News Swift API

A basic Swift Package to read [Hacker News](https://news.ycombinator.com) content.

It scrapes the Hacker News webpage, so the content should have 1:1 parity with what is seen in the browser.

## Design

The thought process behind this was to combine and abstract the functionality of these data sources:
- [Hacker News Webpage](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)
- [Hacker News Algolia API](https://hn.algolia.com/api)
- [Hacker News Firebase API](https://github.com/HackerNews/API)

### Why web scraping?

This library is primarily used personally for building a new reader app for Hacker News on Apple devices. Web scraping is inefficient, but existing APIs are unsuitable for making an app.

The [Hacker News Firebase API](https://github.com/HackerNews/API) is [designed mostly around their in-memory data structures](https://github.com/HackerNews/API#design). This leaves a lot to be desired as a client, since walking backwards through IDs requires a *lot* of network calls.

The [Hacker News Algolia API](https://hn.algolia.com/api) is closer, but is missing some critical functionality for an app. The default view of the app should match the default view of the Hacker News homepage, but loading stories at the `/news` path is unsupported.

So, with no other options to get this data, web scraping ended up being the easiest option.

### Dependencies

These are the awesome Swift Packages that made this implementation simple:

- [Moya](https://github.com/Moya/Moya) for network abstraction
- [SwiftSoup](https://github.com/scinfu/SwiftSoup) for HTML parsing

### Testing

Because this project is a side project, this Package only includes integration tests (see [Apple's testing overview](https://developer.apple.com/documentation/xcode/testing-your-apps-in-xcode#Overview) for more information on the testing pyramid).

While this doesn't give this Package fine-level assertions, it does verify that it works without having to write too much code.

## Installation

Want to use this in your own Hacker News project in Swift?

### Swift Package Manager

Follow [Apple's "Adding package dependencies to your app](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app) guide to add this repo as a dependency:

```swift
...
dependencies: [
        .package(url: "" /* No repo yet! */, from: "1.0.0"),
],
targets: [
    .target( name: "MyTarget", dependencies: ["HackerNewsSwiftAPI"]),
]
...
```

## Usage

Simply list the stories from your Swift project:

```swift
import HackerNewsSwiftAPI

struct MyProject {
    let stories: [Story]

    init() async throws {
        let hackerNews = HackerNews()
        self.stories = try await hackerNews.list(.news, forPage: 1)
    }
}
```