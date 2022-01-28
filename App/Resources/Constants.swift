import Foundation

/// Note: these are hard-coded for demo purposes only. Please see the documentation for Epidemic Sound's
/// Partner Content API for proper use (https://partner-content-api.epidemicsound.com).
enum Tracks {
    static let trackOne = TrackResource(
        id: "1",
        name: "track one",
        url: URL(string: "https://hls.epidemicsound.com/hls/v1/U8aM5YiRsM/6d530410bf8b25ac7fc9ffdbeb842d70/master.m3u8")!,
        signedCookie: SignedCookie(
            name: "Cloud-CDN-Cookie",
            domain:  "hls.epidemicsound.com",
            path: "/",
            value: "URLPrefix=aHR0cHM6Ly9obHMuZXBpZGVtaWNzb3VuZC5jb20vaGxzL3YxL1U4YU01WWlSc00vNmQ1MzA0MTBiZjhiMjVhYzdmYzlmZmRiZWI4NDJkNzA=:Expires=1957277314:KeyName=es-platform-prod-secret-signing-key-hls:Signature=n8AjXZG36U-ipxpfib0L1DsbYEg=",
            expires: "2032-01-09T16:08:34Z"
        )!)

    static let trackTwo = TrackResource(
        id: "2",
        name: "track two",
        url: URL(string: "https://hls.epidemicsound.com/hls/v1/f2rtAq8RaC/80a796cab4e059fc2d28b0b4a3b11a4d/master.m3u8")!,
        signedCookie: SignedCookie(
            name: "Cloud-CDN-Cookie",
            domain:  "hls.epidemicsound.com",
            path: "/",
            value: "URLPrefix=aHR0cHM6Ly9obHMuZXBpZGVtaWNzb3VuZC5jb20vaGxzL3YxL2YycnRBcThSYUMvODBhNzk2Y2FiNGUwNTlmYzJkMjhiMGI0YTNiMTFhNGQ=:Expires=1957277140:KeyName=es-platform-prod-secret-signing-key-hls:Signature=BAKVUgWrSR-DDn4Wyq_HbkqJZl4=",
            expires: "2032-01-09T16:05:40Z"
        )!)
}
