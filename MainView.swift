import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
struct MainView: View {
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
