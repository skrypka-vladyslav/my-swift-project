// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "My App",
    platforms: [
        .iOS(.v18)  // Указана минимальная версия iOS
    ],
    products: [
        .iOSApplication(  // Используется .iOSApplication вместо .app
            name: "My App",
            targets: ["AppModule"]
        ),
    ],
    targets: [
        .target(
            name: "AppModule",
            path: ".",  // Указание пути к основным файлам проекта
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")  // Если необходимо для проекта
            ]
        ),
    ]
)
