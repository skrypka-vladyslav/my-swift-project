import SwiftUI

struct ContentView: View {
    @State private var isRegistered = false  // Флаг для проверки регистрации
    @State private var isLoggedIn = false  // Флаг для входа пользователя
    @State private var name = ""
    @State private var email = ""
    
    @AppStorage("isDarkMode") private var isDarkMode = true // Переменная для темы
    @AppStorage("language") private var selectedLanguage = "ru" // Язык по умолчанию
    
    @State private var currentTime = Date() // Текущее время
    
    // Обновление времени каждую секунду
    func updateTime() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            currentTime = Date()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Верхняя панель с временем
                HStack {
                    Text("Время: \(formattedTime(currentTime))")
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                
                if !isRegistered {
                    // Экран регистрации
                    Text("Регистрация")
                        .font(.largeTitle)
                        .padding()
                    
                    TextField("Введите имя", text: $name)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Введите email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: handleRegister) {
                        Text("Зарегистрироваться")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                } else if !isLoggedIn {
                    // Экран входа
                    Text("Вход в аккаунт")
                        .font(.largeTitle)
                        .padding()
                    
                    TextField("Введите email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: handleLogin) {
                        Text("Войти")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                } else {
                    // Экран списка курсов
                    CoursesListView()
                    
                    // Кнопка для перехода в настройки аккаунта
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
                
                Spacer()
                
                // Меню для выбора темы и языка
                VStack {
                    Picker("Тема", selection: $isDarkMode) {
                        Text("Светлая").tag(false)
                        Text("Темная").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Picker("Язык", selection: $selectedLanguage) {
                        Text("Русский").tag("ru")
                        Text("Украинский").tag("uk")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
            }
            .padding()
            .onAppear {
                updateTime()  // Обновление времени при появлении
            }
            .preferredColorScheme(isDarkMode ? .dark : .light) // Переключение темы
            .environment(\.locale, Locale(identifier: selectedLanguage)) // Переключение языка
        }
    }
    
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
    
    func handleRegister() {
        if name.isEmpty || email.isEmpty {
            print("Ошибка: Все поля обязательны для заполнения")
            return
        }
        
        print("Регистрация успешна! Имя: \(name), Email: \(email)")
        isRegistered = true
    }
    
    func handleLogin() {
        if email.isEmpty {
            print("Ошибка: Введите email для входа")
            return
        }
        
        print("Вход успешен для пользователя с email: \(email)")
        isLoggedIn = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

