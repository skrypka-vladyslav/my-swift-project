import Foundation

struct Course: Identifiable {
    var id: UUID = UUID()
    var name: String
    var price: Double
}
