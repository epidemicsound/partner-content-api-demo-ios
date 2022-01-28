import SwiftUI

struct CollectionsContentView: View {
    @ObservedObject var viewModel: CollectionsContentViewModel
    
    var body: some View {
        NavigationView {
        ScrollView {
            Text(viewModel.content)
                .font(.title).bold()
                .border(Color.orange)
            
            VStack() {
                ForEach(viewModel.collectionsResponse?.collections ?? [Collection]()) { collection in
//                    Button(collection.name, action: {
//                        viewModel.userDidSelectCollection(collectionId: collection.id)
//                    })
                    NavigationLink(destination: CollectionTracksView(
                        viewModel: viewModel.createCollectionTracksViewModel(for: collection)
                    ), label: {
                        Text(collection.name)
                    })
                            
                    }
            }
            

        }
        }
    }
    
}

struct CollectionsContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsContentView(viewModel: CollectionsContentViewModel())
    }
}
