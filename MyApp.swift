import SwiftUI

@main
struct MyApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = true  // Состояние темы
    @AppStorage("language") private var language = "ru" // Язык (русский или украинский)
    
    var body: some Scene {
        WindowGroup {
            ContentView()  // Основной экран приложения
                .preferredColorScheme(isDarkMode ? .dark : .light) // Устанавливаем тему
                .environment(\.locale, Locale(identifier: language)) // Устанавливаем язык
        }
    }
}

