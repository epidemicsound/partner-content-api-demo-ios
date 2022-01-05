import AVFoundation

struct AudioContentProvider {
    /// HLS streams consist of playlist manifests and audio segments. To control access to these files,
    /// CDNs use signed cookies. These let the client access all the files with a given url path prefix.
    func avItem(for trackResource: TrackResource) -> AVPlayerItem? {
        let cookieOptions = [
            AVURLAssetHTTPCookiesKey: [trackResource.signedCookie.httpCookie]
        ]
        let urlAsset = AVURLAsset(url: trackResource.url, options: cookieOptions)
        return AVPlayerItem.init(asset: urlAsset)
    }
}
