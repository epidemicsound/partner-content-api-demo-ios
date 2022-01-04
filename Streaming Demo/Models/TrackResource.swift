import Foundation

struct TrackResource: Identifiable {
    typealias Identifier = Int

    let id: Identifier
    let name: String
    let url: URL
    let signedCookie: SignedCookie
}
