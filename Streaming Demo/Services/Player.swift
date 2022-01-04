///
/// This is a sample implementation of an audio player that uses on demand HLS streams with signed cookies
/// on iOS. It uses AVFoundation (https://developer.apple.com/documentation/avfoundation), which takes care
/// of the complexities of HLS, and therefore it would be very similar to an equivalent implementation for
/// playing standard audio files.
///
/// This is for example purposes only and is meant to complement the documentation for Epidemic Sound's
/// Partner Content API (https://partner-content-api.epidemicsound.com).
///

import AVFoundation

class Player {
    /// In content creator apps users often preview short segments of tracks. By setting the preferred
    /// forward buffer duration you can limit unnecessary data usage.
    internal var preferredForwardBufferDuration: TimeInterval = 18
    internal var isPlaying: Bool {
        return avPlayer.rate > 0
    }
    private var avPlayer: AVPlayer

    init() {
        avPlayer = AVPlayer.init()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(Player.handleDidPlayToEnd),
            name: Notification.Name.AVPlayerItemDidPlayToEndTime,
            object: self.avPlayer.currentItem)
    }
 
    func play(_ avPlayerItem: AVPlayerItem) {
        avPlayerItem.preferredForwardBufferDuration = preferredForwardBufferDuration
        avPlayer.replaceCurrentItem(with: avPlayerItem)
        avPlayer.play()
    }

    func play() {
        avPlayer.play()
    }

    func pause() {
        avPlayer.pause()
    }

    @objc func handleDidPlayToEnd() {
        // Seek to the beginning so that the track can be played again.
        avPlayer.seek(to: .zero)
    }
}
