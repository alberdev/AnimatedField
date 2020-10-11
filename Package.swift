// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AnimatedField",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AnimatedField",
            targets: ["AnimatedField"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AnimatedField",
            dependencies: [],
            path: "AnimatedField",
            resources: [
                .copy("AnimatedField.xib")
            ]
        )
    ]
)
