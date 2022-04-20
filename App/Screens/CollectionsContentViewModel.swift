import Foundation

class CollectionsContentViewModel: ObservableObject {
    let content = "Collections"
    @Published var subTitle = "0"
    @Published var collectionsResponse: CollectionsResponse? = nil
    @Published var accessToken: String? = nil
    
    func getCollections() {
        PartnerContentAPI().getCollections(
            accessToken: self.accessToken,
            collectionsCompletionHandler: {
                collectionsResponse, error in
                

                if let collectionsResponse = collectionsResponse {
                    print(collectionsResponse)
                    
                    DispatchQueue.main.async {
                        self.collectionsResponse = collectionsResponse
                    }
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
    
    func auth() {
        AuthService(onSuccess: setAccessToken).auth()
    }
    
    func setAccessToken(accessToken: String) {
        self.accessToken = accessToken
        getCollections()
    }

}
