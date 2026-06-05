import Foundation

struct Training: Identifiable, Codable {
    var id = UUID()
    let name: String
    let part: String
    let weight: String
    let reps: String
    let sets: String
}
