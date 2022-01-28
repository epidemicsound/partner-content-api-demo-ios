import Foundation

struct Collection: Decodable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let name: String
    let tracks: [Track]?

}
