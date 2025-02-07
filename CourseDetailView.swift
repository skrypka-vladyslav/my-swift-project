
import SwiftUI

struct CourseDetailView: View {
    var course: Course

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: course.imageName)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
            } placeholder: {
                ProgressView()
            }

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
