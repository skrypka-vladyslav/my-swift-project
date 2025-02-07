import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
struct DateTimeSelectionView: View {
    @State private var selectedDate = Date()
    @State private var selectedTime = "10:00"
    
    let availableTimes = ["10:00", "11:00", "12:00"]
    
    var body: some View {
        VStack {
            if #available(macOS 11.0, iOS 14.0, *) { // Используем macOS 11 и iOS 14 и выше для DatePicker
                DatePicker("Выберите дату", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                    .padding()
            } else {
                Text("DatePicker не поддерживается на этой версии операционной системы.")
            }
            
            Picker("Выберите время", selection: $selectedTime) {
                ForEach(availableTimes, id: \.self) { time in
                    Text(time)
                }
            }
            .padding()
            
            Button(action: {
                // Логика записи
            }) {
                Text("Записаться")
            }
        }
    }
}
