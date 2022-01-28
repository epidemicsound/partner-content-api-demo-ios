import SwiftUI

struct CollectionsContentView: View {
    @EnvironmentObject var viewModel: CollectionsContentViewModel
    
    var body: some View {
        
        ScrollView {
            Text(viewModel.content)
                .font(.title).bold()
            Text(viewModel.subTitle)
            
            VStack() {
                ForEach(viewModel.collectionsResponse?.collections ?? [Collection]()) { collection in
                    Text(collection.name).font(.title2).italic()
                            
                    }
            }
            

        }
            .onAppear {
                viewModel.getCollections()
                viewModel.subTitle = "12"

            }
    }
    
}

struct CollectionsContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsContentView()
    }
}
