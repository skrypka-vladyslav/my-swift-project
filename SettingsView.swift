import SwiftUI
import UserNotifications

struct SettingsView: View {
    @Binding var isDarkMode: Bool
    @Binding var selectedLanguage: String
    
    @State private var name = "Иван"
    @State private var email = "ivan@example.com"
    @State private var selectedCourses: Set<String> = []
    @State private var notificationTime: Date = Date()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var currentTime: String = ""
    
    let courses = [
        "COMBI BASE",
        "UNIVERSAL",
        "COSMOS",
        "SMART PEDICURE"
    ]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "Europe/Kyiv")
        return formatter
    }()
    
    func updateTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.currentTime = dateFormatter.string(from: Date())
        }
    }
    
    func scheduleCriticalNotification(for course: String, at time: Date) {
        let content = UNMutableNotificationContent()
        content.title = "⚠️ Критическое напоминание"
        content.body = "Не забудьте про курс \(course)!"
        content.sound = UNNotificationSound.defaultCritical
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: time), repeats: false)
        
        let request = UNNotificationRequest(identifier: course, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Ошибка при планировании уведомления: \(error.localizedDescription)")
            } else {
                print("⚡ Уведомление запланировано для курса \(course)!")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Настройки аккаунта")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Имя", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Текущее время (Киев): \(currentTime)")
                    .font(.headline)
                    .padding()
                    .onAppear {
                        updateTime()
                    }
                
                Text("Выберите курсы для напоминаний")
                    .font(.headline)
                    .padding()
                
                List(courses, id: \.self, selection: $selectedCourses) { course in
                    HStack {
                        Text(course)
                        Spacer()
                        if selectedCourses.contains(course) {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        if selectedCourses.contains(course) {
                            selectedCourses.remove(course)
                        } else {
                            selectedCourses.insert(course)
                        }
                    }
                }
                
                DatePicker("Выберите время напоминания", selection: $notificationTime, displayedComponents: [.hourAndMinute])
                    .padding()
                
                Button(action: {
                    if selectedCourses.isEmpty {
                        alertMessage = "Выберите хотя бы один курс!"
                    } else {
                        for course in selectedCourses {
                            scheduleCriticalNotification(for: course, at: notificationTime)
                        }
                        alertMessage = "⚡ Критические напоминания установлены!"
                    }
                    showAlert = true
                }) {
                    Text("Установить напоминания")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Напоминание"), message: Text(alertMessage), dismissButton: .default(Text("ОК")))
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("✅ Разрешение на уведомления получено")
                } else {
                    print("❌ Разрешение на уведомления не получено")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isDarkMode: .constant(false), selectedLanguage: .constant("ru"))
    }
}

