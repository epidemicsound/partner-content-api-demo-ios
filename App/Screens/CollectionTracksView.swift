import SwiftUI

struct CollectionTracksView: View {
    @ObservedObject var viewModel: CollectionTracksViewModel
    
    var body: some View {
        NavigationView {
        ScrollView {
            Text(viewModel.collectionTitle)
                .font(.title).bold()
                .border(Color.orange)
            ForEach(viewModel.tracks ?? []) { track in
                
                HStack {
                    
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
                    
                    Text(track.title)
                    Spacer()
                }.padding()
                
                
                
            }
        
        }
    }
    
}

struct CollectionTracksView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionTracksView(viewModel: CollectionTracksViewModel(collectionTitle: "Demo", tracks: nil))
    }
}
}
