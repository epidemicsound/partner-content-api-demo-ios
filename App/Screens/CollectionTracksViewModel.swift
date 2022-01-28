import Foundation


class CollectionTracksViewModel: ObservableObject {
    private let player = Player()
    private let audioContentProvider = AudioContentProvider()
    let collectionTitle: String
    let tracks: [Track]?
    @Published var hlsTrackResponse: HLSTrackResponse? = nil

    internal init(collectionTitle: String, tracks: [Track]?) {
        self.collectionTitle = collectionTitle
        self.tracks = tracks
    }

    func didSelectTrack(track: Track) {
        PartnerContentAPI().getHLSTrack(id: track.id,
            hlsTrackCompletionHandler: {
                hlsTrackResponse, error in

                if let hlsTrackResponse = hlsTrackResponse {
                    DispatchQueue.main.async {
                        self.hlsTrackResponse = hlsTrackResponse
                        guard let trackURL = URL(string: hlsTrackResponse.url) else {
                            return
                        }
                        guard let signedCookie = SignedCookie(
                            name: hlsTrackResponse.cookie.name,
                            domain: hlsTrackResponse.cookie.domain,
                            path: hlsTrackResponse.cookie.path,
                            value: hlsTrackResponse.cookie.value,
                            expires: hlsTrackResponse.cookie.expires
                        ) else {
                            return
                        }
                        guard let avItem = self.audioContentProvider.avItem(for: TrackResource(
                            id: track.id,
                            name: track.title,
                            url: trackURL,
                            signedCookie: signedCookie
                        )) else {
                            return
                        }
                        self.player.play(avItem)
                    }
                }
            }
        )
    }
}
