import Foundation

struct CollectionsContentViewModel {
    let content = "Hello content view"
    
    init() {
        getCollections()
    }
    
    func getCollections() {
        PartnerContentAPI().getCollections()
    }
}
