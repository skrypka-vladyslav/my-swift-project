import SwiftUI

@main
struct MyManicureApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(macOS 10.15, *) {  // Проверяем доступность macOS 10.15 или выше
                MainView()
            } else {
                Text("Требуется macOS 10.15 или новее для использования приложения")
            }
        }
    }
}
