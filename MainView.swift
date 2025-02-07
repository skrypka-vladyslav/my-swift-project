import SwiftUI

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
