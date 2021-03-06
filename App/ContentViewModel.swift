import Foundation

struct ContentViewModel {

    let tracks = [Tracks.trackOne, Tracks.trackTwo]

    // MARK: Private
    private let player = Player()
    private let audioContentProvider = AudioContentProvider()

    func play(track: TrackResource) {
        guard let audioContent = audioContentProvider.avItem(for: track) else {
            return
        }
        player.play(audioContent)
    }

    func pause() {
        player.pause()
    }
}
