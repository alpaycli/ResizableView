// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResizableView",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ResizableView",
            targets: ["ResizableView"]),
    ],
    targets: [
        .target(
            name: "ResizableView"),
        .testTarget(
            name: "ResizableViewTests",
            dependencies: ["ResizableView"]
        ),
    ]
)
