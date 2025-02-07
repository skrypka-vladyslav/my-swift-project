import SwiftUI

struct CourseDetailView: View {
    var course: Course // Принимаем курс как параметр
    
    var body: some View {
        VStack {
            // Здесь будет фото курса, описание и название
            Image(course.imageName) // Или используйте URL или SF Symbols, если необходимо
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding()
            
            Text(course.name)
                .font(.title)
                .padding()
            
            Text(course.description)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(course.name, displayMode: .inline)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Пример использования CourseDetailView с курсом
        CourseDetailView(course: Course(name: "COMBI BASE", description: "Полный курс для новичков.", imageName: "combi_base"))
        
    }
    
}

