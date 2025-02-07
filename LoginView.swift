import SwiftUI

struct LoginView: View {
    @State private var emailOrPhone = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            TextField("Email или Телефон", text: $emailOrPhone)
                .padding()
            Button(action: {
                // Вход логика
                isLoggedIn = true
            }) {
                Text("Войти")
            }
        }
    }
}
