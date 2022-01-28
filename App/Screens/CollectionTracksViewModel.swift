import Foundation


class CollectionTracksViewModel: ObservableObject {
    let collectionTitle: String
    let tracks: [Track]?

    internal init(collectionTitle: String, tracks: [Track]?) {
        self.collectionTitle = collectionTitle
        self.tracks = tracks
    }
}
