
import SwiftUI

struct Course: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
}
