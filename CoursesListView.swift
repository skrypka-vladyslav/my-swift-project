import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
}

struct CoursesListView: View {
    let courses = [
        Course(name: "COMBI BASE", description: "Полный курс для новичков.", imageName: "combi_base"),
        Course(name: "UNIVERSAL", description: "Универсальный курс для всех типов маникюра.", imageName: "universal"),
        Course(name: "COSMOS", description: "Продвинутый курс для экспертов.", imageName: "cosmos"),
        Course(name: "SMART PEDICURE", description: "Курс по уходу за ногтями и кожей.", imageName: "smart_pedicure")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Список курсов")
                    .font(.largeTitle)
                    .padding()
                
                List(courses) { course in
                    NavigationLink(destination: CourseDetailView(course: course)) {
                        HStack {
                            // Ensure the image exists or use a placeholder
                            Image(course.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.trailing, 10)
                            
                            VStack(alignment: .leading) {
                                Text(course.name)
                                    .font(.headline)
                                    .padding(.bottom, 5)
                                Text(course.description)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 5)
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationBarTitle("Курсы по маникюру", displayMode: .inline)
            }
        }
    }
}

struct CoursesListView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesListView()
    }
}
