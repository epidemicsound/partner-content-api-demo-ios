import Foundation

class CollectionsContentViewModel: ObservableObject {
    let content = "Collections"
    @Published var subTitle = "0"
    @Published var collectionsResponse: CollectionsResponse? = nil
    
    init() {
        getCollections()
    }
    
    func getCollections() {
        PartnerContentAPI().getCollections(
            collectionsCompletionHandler: {
                collectionsResponse, error in
                

                if let collectionsResponse = collectionsResponse {
                    print(collectionsResponse)
                    
                    DispatchQueue.main.async {
                        self.collectionsResponse = collectionsResponse
                    }
                    
                    
                    print("loaded")
                    print(self.collectionsResponse)
                }
            }
        )
    }
    func userDidSelectCollection(collectionId: String) {
        print(collectionId)
    }
    
    func createCollectionTracksViewModel( for collection: Collection) -> CollectionTracksViewModel {

        return CollectionTracksViewModel(collectionTitle: collection.name, tracks: collection.tracks)
        
        
    }
    
}
