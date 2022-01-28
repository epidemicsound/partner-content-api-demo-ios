import Foundation

class CollectionsContentViewModel: ObservableObject {
    let content = "Collections"
    @Published var subTitle = "0"
    @Published var collectionsResponse: CollectionsResponse? = nil
    
    func getCollections() {
        PartnerContentAPI().getCollections(
            collectionsCompletionHandler: {
                collectionsResponse, error in
                
                if let collectionsResponse = collectionsResponse {
                    print(collectionsResponse)
                    self.collectionsResponse = collectionsResponse
                    print("loaded")
                    print(self.collectionsResponse)
                }
            }
        )
    }
}
