// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HackerNewsSwiftAPI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HackerNewsSwiftAPI",
            targets: ["HackerNewsSwiftAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HackerNewsSwiftAPI",
            dependencies: ["Moya", "SwiftSoup"]),
        .testTarget(
            name: "HackerNewsSwiftAPITests",
            dependencies: ["HackerNewsSwiftAPI"]),
    ]
)
