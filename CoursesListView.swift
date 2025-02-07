import SwiftUI

struct CoursesListView: View {
    let courses = [
        Course(name: "COMBI BASE", description: "Полный курс для новичков.", imageName: "combi_base"),
        Course(name: "UNIVERSAL", description: "Универсальный курс для всех типов маникюра.", imageName: "universal"),
        Course(name: "COSMOS", description: "Продвинутый курс для экспертов.", imageName: "cosmos"),
        Course(name: "SMART PEDICURE", description: "Курс по уходу за ногтями и кожей.", imageName: "smart_pedicure")
    ]
    
    var body: some View {
        VStack {
            Text("Список курсов")
                .font(.largeTitle)
                .padding()
            
            List(courses, id: \.name) { course in
                NavigationLink(destination: CourseDetailView(course: course)) {
                    HStack {
                        Image(course.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        Text(course.name)
                            .padding()
                    }
                }
            }
            .navigationBarTitle("Курсы по маникюру", displayMode: .inline)
        }
    }
}

struct CoursesListView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesListView()
    }
}

