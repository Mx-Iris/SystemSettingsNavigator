// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SystemSettingsNavigator",
    platforms: [
        .macOS(.v13), .macCatalyst(.v16),
    ],
    products: [
        .library(
            name: "SystemSettingsNavigator",
            targets: ["SystemSettingsNavigator"]
        ),
    ],
    targets: [
        .target(
            name: "SystemSettingsNavigator"
        ),
        .testTarget(
            name: "SystemSettingsNavigatorTests",
            dependencies: ["SystemSettingsNavigator"]
        ),
    ]
)
