// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Define supported platforms based on OS
// Linux doesn't use the platforms array; Apple platforms require minimum versions
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
let supportedPlatforms: [SupportedPlatform] = [
    .iOS(.v15),
    .macOS(.v12),
    .macCatalyst(.v14),
    .tvOS(.v15),
    .watchOS(.v8),
    .visionOS(.v1),
]
#else
let supportedPlatforms: [SupportedPlatform]? = nil
#endif

let package = Package(
    name: "Stripe",
    platforms: supportedPlatforms,
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
