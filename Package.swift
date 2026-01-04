// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Stripe",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .macCatalyst(.v14),
    ],
    products: [
        .library(
            name: "Stripe",
            targets: ["Stripe"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Stripe",
            dependencies: []),
        .testTarget(
            name: "StripeTests",
            dependencies: ["Stripe"]),
    ]
)
