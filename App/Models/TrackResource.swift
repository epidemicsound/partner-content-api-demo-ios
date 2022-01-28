import Foundation

struct TrackResource: Identifiable {
    typealias Identifier = String

    let id: Identifier
    let name: String
    let url: URL
    let signedCookie: SignedCookie
}
