
import SwiftUI

struct ContentView: View {
    @State private var isRegistered = false
    @State private var isLoggedIn = false
    @State private var name = ""
    @State private var email = ""

    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("language") private var selectedLanguage = "ru"

    var body: some View {
        NavigationView {
            VStack {
                if !isRegistered {
                    RegistrationView(name: $name, email: $email, isRegistered: $isRegistered)
                } else if !isLoggedIn {
                    LoginView(email: $email, isLoggedIn: $isLoggedIn)
                } else {
                    CoursesListView()
                }

                NavigationLink(destination: SettingsView(isDarkMode: $isDarkMode, selectedLanguage: $selectedLanguage)) {
                    Text("Настройки аккаунта")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top)
                }
            }
            .padding()
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
