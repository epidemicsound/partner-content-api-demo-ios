import AVFoundation

struct AudioContentProvider {
    func avItem(for url: URL) -> AVPlayerItem? {
        guard let cookiesArray = HTTPCookieStorage.shared.cookies else {
            return nil
        }
        let cookieOptions = [AVURLAssetHTTPCookiesKey: cookiesArray]
        let urlAsset = AVURLAsset(url: url, options: cookieOptions)
        return AVPlayerItem.init(asset: urlAsset)
    }

    /// HLS streams consist of playlist manifests and audio segments. To control access to these files,
    /// CDNs use signed cookies. These let the client access all the files with a given url path prefix.
    func persist(cookie: SignedCookie) {
        HTTPCookieStorage.shared.setCookie(cookie.httpCookie)
    }
}
