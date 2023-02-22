// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDWebImage",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SDWebImage",
            targets: ["SDWebImage"]),
//        .library(
//            name: "SDWebImageSwift",
//            targets: ["SDWebImageSwift"]),
//        .library(
//            name: "SDWebImageObjc",
//            targets: ["SDWebImageObjc"]),
        .library(
            name: "SDWebImageMapKit",
            targets: ["SDWebImageMapKit"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SDWebImage",
            dependencies: ["_SDWebImageSwift", "_SDWebImageObjc"]
        ),
        .target(
            name: "_SDWebImageObjc",
            path: "SDWebImage",
            sources: ["Core", "Private"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("Core"),
                .headerSearchPath("Private")
            ]
        ),
        .target(
            name: "_SDWebImageSwift",
            dependencies: ["_SDWebImageObjc"],
            path: "SDWebImage",
            sources: ["Swift"]
        ),
        .target(
            name: "SDWebImageMapKit",
            dependencies: ["SDWebImage"],
            path: "SDWebImageMapKit",
            sources: ["MapKit"]
        ),
        .testTarget(name: "DemoTests", dependencies: ["SDWebImage"]),
    ]
)
