import SwiftUI

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
