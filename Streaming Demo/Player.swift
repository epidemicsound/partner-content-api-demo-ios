import Foundation
import AVFoundation

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
 
    func play(url: URL) {
        let cookie = HTTPCookie(properties: [
            .name: "Cloud-CDN-Cookie",
            .path:"/honesty/",
            .domain: "hls-investigation.epidemicsite.com",
            .value: "URLPrefix=aHR0cHM6Ly9obHMtaW52ZXN0aWdhdGlvbi5lcGlkZW1pY3NpdGUuY29tL2hvbmVzdHkv:Expires=1634898182:KeyName=es-platform-dev-signed-url-key-hls-investigation:Signature=4eIs4j_oF6vpogoyg0QFpHtC5n0="
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
