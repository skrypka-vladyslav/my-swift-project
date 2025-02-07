// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MyApp",
    platforms: [
        .iOS(.v16) // Используем поддержку iOS версии 16
    ],
    products: [
        .application(
            name: "My App", // Заменяем .iOSApplication на .application
            targets: ["AppModule"]
        )
    ],
    targets: [
        .target(
            name: "AppModule",
            path: ".",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)
