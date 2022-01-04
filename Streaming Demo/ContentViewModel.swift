import Foundation

struct ContentViewModel {

    // MARK: Private
    private let player = Player()
    private let audioContentProvider = AudioContentProvider()

    func play(track: TrackResource) {
        audioContentProvider.persist(cookie: track.signedCookie)
        guard let audioContent = audioContentProvider.avItem(for: track.url) else {
            return
        }
        player.play(audioContent)
    }

    func pause() {
        player.pause()
    }
}
