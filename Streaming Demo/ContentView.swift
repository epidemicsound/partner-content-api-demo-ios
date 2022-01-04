import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Streaming Demo")
                    .font(.title)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()

            Rectangle()
                .frame(width: 140, height: 1)
                .padding(.horizontal)

            Spacer()
                .frame(height: 60)

            ForEach(viewModel.tracks) { track in
                buttonView(label: "Play \(track.name)", imageName: "play.fill") {
                    viewModel.play(track: track)
                }
            }

            buttonView(label: "Pause all", imageName: "pause.fill") {
                viewModel.pause()
            }

            Spacer()
        }
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black
                .opacity(0.95)
                .edgesIgnoringSafeArea(.all)
        )
    }

    func buttonView(label: String, imageName: String, action: @escaping ()->()) -> some View {
        return Button() {
            action()
        } label: {
            HStack(spacing: 12) {
                Text(label)
                Image(systemName: imageName)
            }
        }
        .foregroundColor(Color.white)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
