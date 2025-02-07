// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "my-swift-project",
    platforms: [
        .iOS(.v9)  // Устанавливаем минимальную версию iOS
    ],
    products: [
        .library(
            name: "my-swift-project",
            targets: ["my-swift-project"]
        ),
    ],
    targets: [
        .target(
            name: "my-swift-project",
            dependencies: []
        ),
        .testTarget(
            name: "my-swift-projectTests",
            dependencies: ["my-swift-project"]
        ),
    ]
)
