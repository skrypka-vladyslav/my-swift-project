import SwiftUI

@available(macOS 11.0, *)  // Указываем, что поддерживаем только macOS 11.0 и выше
struct CourseSelectionView: View {
    @State private var selectedCourse: Course?
    
    var courses: [Course]
    
    var body: some View {
        List(courses) { course in
            HStack {
                Text(course.name)
                Spacer()
                Text("\(course.price)₴")
            }
            .onTapGesture {
                selectedCourse = course
                // Переход к выбору даты и времени
            }
        }
    }
}
