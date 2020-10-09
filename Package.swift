swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AnimatedField",
    products: [
        .library(
            name: "AnimatedField",
            targets: ["AnimatedField"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AnimatedField",
            dependencies: [],
            path: "AnimatedField")
    ]
)
