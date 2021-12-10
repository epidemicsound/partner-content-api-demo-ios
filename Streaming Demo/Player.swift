//
// This is a sample implementation of an audio player that uses on demand HLS streams
// with signed cookies on iOS. It uses AVFoundation, which takes care of the complexities
// of HLS, and therefore it would be very similar to an equivalent implementation for playing
// standard audio files.
//
// This is for example purposes only and is meant to complement the documentation for
// Epidemic Sound's Partner Content API (https://partner-content-api.epidemicsound.com/).
//

import Foundation
import AVFoundation

struct SignedCookie {
    let name: String
    let path: String
    let value: String
    let domain: String

    init(cookieString: String, domain: String) {
        let cookieArray = cookieString.split(separator: "=", maxSplits: 1).map(String.init)
        name = cookieArray.first ?? ""
        path = "/"
        value = cookieArray.last ?? ""
        self.domain = domain
    }
}

class Player {
    var avPlayer: AVPlayer
    var avPlayerItem: AVPlayerItem?

    init() {
        avPlayer = AVPlayer.init()
        avPlayerItem = nil
        NotificationCenter.default.addObserver(self, selector: #selector(Player.handleDidPlayToEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.avPlayer.currentItem)
    }
 
    func play(url: URL, signedCookie: SignedCookie) {
        // HLS streams consist of playlist manifests and audio segments. To control access to these files,
        // CDNs use signed cookies. These let the client access all the files with a given url path prefix.
        let cookie = HTTPCookie(properties: [
            .name: signedCookie.name,
            .domain: signedCookie.domain,
            .path: signedCookie.path,
            .value: signedCookie.value
        ])
        HTTPCookieStorage.shared.setCookie(cookie!)
        let cookiesArray = HTTPCookieStorage.shared.cookies!
        let cookieOptions = [AVURLAssetHTTPCookiesKey: cookiesArray]
        let urlAsset = AVURLAsset(url: url, options: cookieOptions)
        avPlayerItem = AVPlayerItem.init(asset: urlAsset)
        // In content creator apps users often preview short segments of tracks. By setting the preferred forward
        // buffer duration you can limit unnecessary data usage.
        avPlayerItem?.preferredForwardBufferDuration = 18
        avPlayer.replaceCurrentItem(with: avPlayerItem)
        avPlayer.play()
    }

    func play() {
        avPlayer.play()
    }

    func pause() {
        if (avPlayer.rate == 1) {
            avPlayer.pause()
        }
    }

    @objc func handleDidPlayToEnd() {
        // Seek to the beginning so that the track can be played again.
        avPlayer.seek(to: .zero)
    }
}
