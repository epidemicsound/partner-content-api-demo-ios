import SwiftUI

struct CollectionTracksView: View {
    @ObservedObject var viewModel: CollectionTracksViewModel
    
    var body: some View {
        NavigationView {
        ScrollView {
            Text(viewModel.collectionTitle)
                .font(.title).bold()
                .border(Color.orange)
        }
        }
    }
    
}

struct CollectionTracksView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionTracksView(viewModel: CollectionTracksViewModel(collectionTitle: "Demo", tracks: nil))
    }
}
