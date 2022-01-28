import SwiftUI

struct CollectionTracksView: View {
    @ObservedObject var viewModel: CollectionTracksViewModel
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 24)
            
            ForEach(viewModel.tracks ?? []) { track in
                trackCellView(for: track)
            }
        }
        .foregroundColor(Color.white)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle(viewModel.collectionTitle)
    }

    @ViewBuilder func trackCellView(for track: Track) -> some View {
        HStack(spacing: 16) {
            trackImage(for: track)
            Text(track.title)
                .font(Font.title3)
            Spacer()
        }
        .padding(.horizontal)
    }

    @ViewBuilder func trackImage(for track: Track) -> some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: track.images.standard)){ image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.1)
            }
            .frame(width: 80, height: 80)
            .cornerRadius(6)
        } else {
            // Fallback on earlier versions
            EmptyView()
        }
    }
}

struct CollectionTracksView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionTracksView(viewModel: CollectionTracksViewModel(collectionTitle: "Demo", tracks: nil))
    }
}

