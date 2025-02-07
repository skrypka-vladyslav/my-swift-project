import SwiftUI

@available(macOS 11.0, iOS 13.0, *)
struct MainView: View {
    // Пример списка курсов
    let sampleCourses = [
        Course(name: "Курс 1", price: 100),
        Course(name: "Курс 2", price: 150),
        Course(name: "Курс 3", price: 200)
    ]
    
    var body: some View {
        TabView {
            CourseSelectionView(courses: sampleCourses)
                .tabItem {
                    Text("Курсы")
                }
            SettingsView()
                .tabItem {
                    Text("Настройки")
                }
        }
    }
}
