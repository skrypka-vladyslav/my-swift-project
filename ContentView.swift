import SwiftUI

@main
@available(macOS 11.0, *)  // Указываем, что приложение поддерживает только macOS 11.0 и выше
struct MyManicureApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(macOS 11.0, *) {  // Проверка доступности macOS 11.0 или выше
                MainView()
            } else {
                Text("Требуется macOS 11.0 или новее для использования приложения")
            }
        }
    }
}
