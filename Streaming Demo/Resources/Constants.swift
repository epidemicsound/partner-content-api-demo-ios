import Foundation

/// Note: these are hard-coded for demo purposes only. Please see the documentation for Epidemic Sound's
/// Partner Content API for proper use (https://partner-content-api.epidemicsound.com).
enum Tracks {
    static let trackOne = TrackResource(
        url: URL(string: "https://hls-investigation.epidemicsite.com/hls/v1/U8aM5YiRsM/6d530410bf8b25ac7fc9ffdbeb842d70/master.m3u8")!,
        signedCookie: SignedCookie(
            name: "Cloud-CDN-Cookie",
            domain:  "hls-investigation.epidemicsite.com",
            path: "/",
            value: "URLPrefix=aHR0cHM6Ly9obHMtaW52ZXN0aWdhdGlvbi5lcGlkZW1pY3NpdGUuY29tL2hscy92MS9VOGFNNVlpUnNNLzZkNTMwNDEwYmY4YjI1YWM3ZmM5ZmZkYmViODQyZDcw:Expires=1671841598:KeyName=es-platform-dev-signed-url-key-hls-investigation:Signature=BRLH59OkUc7K3N-qDUC-7yHXBOY=",
            expires: "2022-12-24T00:26:38Z"
        )!)

    static let trackTwo = TrackResource(
        url: URL(string: "https://hls-investigation.epidemicsite.com/hls/v1/f2rtAq8RaC/80a796cab4e059fc2d28b0b4a3b11a4d/master.m3u8")!,
        signedCookie: SignedCookie(
            name: "Cloud-CDN-Cookie",
            domain:  "hls-investigation.epidemicsite.com",
            path: "/",
            value: "URLPrefix=aHR0cHM6Ly9obHMtaW52ZXN0aWdhdGlvbi5lcGlkZW1pY3NpdGUuY29tL2hscy92MS9mMnJ0QXE4UmFDLzgwYTc5NmNhYjRlMDU5ZmMyZDI4YjBiNGEzYjExYTRk:Expires=1671841863:KeyName=es-platform-dev-signed-url-key-hls-investigation:Signature=oofBkNsqR4BIx-zdiP4WIur9qe4=",
            expires: "2022-12-24T00:31:03Z"
        )!)
}
