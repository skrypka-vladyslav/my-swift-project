// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "My App",
    platforms: [
        .iOS(.v18)  // Указываем минимальную версию iOS
    ],
    products: [
        .app(
            name: "My App",
            targets: ["AppModule"]
        ),
    ],
    targets: [
        .target(
            name: "AppModule",
            path: ".",  // Указываем путь к основной директории проекта
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")  // Если это необходимо для проекта
            ]
        ),
    ]
)
