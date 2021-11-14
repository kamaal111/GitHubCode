// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GHCLocale",
    defaultLocalization: "en",
    products: [
        .library(
            name: "GHCLocale",
            targets: ["GHCLocale"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GHCLocale",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]),
        .testTarget(
            name: "GHCLocaleTests",
            dependencies: ["GHCLocale"]),
    ]
)
