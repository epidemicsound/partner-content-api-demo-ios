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

    func play() {
        avPlayer.play()
    }
 
    func play(url: URL, signedCookie: SignedCookie) {
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
        avPlayerItem?.preferredForwardBufferDuration = 18
        avPlayer.replaceCurrentItem(with: avPlayerItem)
        avPlayer.play()
    }
    
    func pause() {
        if (avPlayer.rate == 1) {
            avPlayer.pause()
        }
    }

    @objc func handleDidPlayToEnd() {
        avPlayer.seek(to: .zero)
    }
}
