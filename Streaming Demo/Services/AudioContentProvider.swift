/// This is a sample implementation of an AudioContentProvider that uses on demand HLS streams with signed cookies
/// on iOS. It uses AVFoundation (https://developer.apple.com/documentation/avfoundation), which takes care
/// of the complexities of HLS, and returns an AVPlayerItem.
///
/// This is for example purposes only and is meant to complement the documentation for Epidemic Sound's
/// Partner Content API (https://partner-content-api.epidemicsound.com).

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
