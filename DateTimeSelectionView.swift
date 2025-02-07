import SwiftUI

struct DateTimeSelectionView: View {
    @State private var selectedDate = Date()
    @State private var selectedTime = "10:00"
    
    let availableTimes = ["10:00", "11:00", "12:00", ...]
    
    var body: some View {
        VStack {
            DatePicker("Выберите дату", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .padding()
            Picker("Выберите время", selection: $selectedTime) {
                ForEach(availableTimes, id: \.self) { time in
                    Text(time)
                }
            }
            Button(action: {
                // Логика записи
            }) {
                Text("Записаться")
            }
        }
    }
}
