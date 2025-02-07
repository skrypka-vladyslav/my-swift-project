
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyApp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MyApp",
            targets: ["AppModule"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppModule",
            dependencies: []
        )
    ]
)
