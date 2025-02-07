import SwiftUI
@available(macOS 11.0, *)
struct RegistrationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var instagram = ""
    @State private var isEmailSelected = false
    @State private var isPhoneSelected = false
    @State private var isInstagramSelected = false
    
    var body: some View {
        VStack {
            TextField("Имя", text: $name)
                .padding()
            if isEmailSelected {
                TextField("Email", text: $email)
                    .padding()
            } else if isPhoneSelected {
                TextField("Телефон", text: $phone)
                    .padding()
            } else if isInstagramSelected {
                TextField("Instagram", text: $instagram)
                    .padding()
            }
            Button(action: {
                // Регистрация логика
            }) {
                Text("Зарегистрироваться")
            }
        }
    }
}
