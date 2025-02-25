import SwiftUI
@available(macOS 11.0, iOS 13.0, *)
struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var selectedLanguage = "ru"
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkMode) {
                Text("Темная тема")
            }
            Picker("Язык", selection: $selectedLanguage) {
                Text("Русский").tag("ru")
                Text("Українська").tag("uk")
            }
        }
    }
}
