// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "my-swift-project",
    platforms: [
        .iOS(.v9)  // Минимальная версия iOS
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
            path: "."  // Указываем путь к текущей директории для поиска исходников
        ),
        .testTarget(
            name: "my-swift-projectTests",
            dependencies: ["my-swift-project"]
        ),
    ]
)
