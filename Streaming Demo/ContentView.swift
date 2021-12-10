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
                    player.play(url: URL(string: "https://hls-investigation.epidemicsite.com/honesty/96k.m3u8")!)
                    //player.play(url: URL(string: "http://10.29.8.152:8005/testing/master.m3u8")!)
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
