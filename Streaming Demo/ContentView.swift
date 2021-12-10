import SwiftUI

struct ContentView: View {
    
    @State var player = Player()
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Play") {
                if (player.avPlayer.rate == 1) {
                    player.pause()
                } else if (player.avPlayerItem != nil) {
                    player.play()
                } else {
                    let signedCookie = SignedCookie(cookieString: "Cloud-CDN-Cookie=URLPrefix=aHR0cHM6Ly9obHMtaW52ZXN0aWdhdGlvbi5lcGlkZW1pY3NpdGUuY29tL2hscy8=:Expires=1639216347:KeyName=es-platform-dev-signed-url-key-hls-investigation:Signature=Rl-oIJ6Ngh-sBkTbuGe7o6mgDc4=", domain: "hls-investigation.epidemicsite.com")
                    player.play(url: URL(string: "https://hls-investigation.epidemicsite.com/hls/v2/DYY22FjCqV/efc6edda6783f47c285b187c6bcdd3b2/master.m3u8")!, signedCookie: signedCookie)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
