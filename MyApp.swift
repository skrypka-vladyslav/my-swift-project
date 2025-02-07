import SwiftUI

@main
struct MyApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = true  // Состояние темы
    @AppStorage("language") private var language = "ru" // Язык (русский или украинский)
    
    // Default fallback values if none are set
    init() {
        if language.isEmpty {
            language = "ru" // Default to Russian if no language is set
        }
        if !isDarkMode {
            isDarkMode = false // Default to light mode if no theme is set
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()  // Основной экран приложения
                .preferredColorScheme(isDarkMode ? .dark : .light) // Устанавливаем тему
                .environment(\.locale, Locale(identifier: language)) // Устанавливаем язык
        }
    }
}
