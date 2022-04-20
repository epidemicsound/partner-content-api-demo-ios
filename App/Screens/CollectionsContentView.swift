import SwiftUI

struct CollectionsContentView: View {
    @ObservedObject var viewModel: CollectionsContentViewModel
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    Spacer()
                        .frame(height: 24)

                    let collections = viewModel.collectionsResponse?.collections ?? [Collection]()

                    ForEach(collections) { collection in
                        collectionCellView(for: collection)
                    }

                    
                }
                
                if(viewModel.accessToken == nil){
                    Button(action: {
                        viewModel.auth()
                        }) {
                            Text("ES Connect")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.white)
                        }
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.009, green: 0.611, blue: 0.865)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                }
                
                
            }
            .foregroundColor(Color.white)
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle(viewModel.content)
        }
    }

    @ViewBuilder
    func collectionCellView(for collection: Collection) -> some View {
        NavigationLink(
            destination: CollectionTracksView(
                viewModel: viewModel.createCollectionTracksViewModel(for: collection)
            ), label: {
                HStack {
                    Text(collection.name)
                        .font(Font.title3)
                    Spacer()
                }
                .padding()
            })
    }
}

struct CollectionsContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsContentView(viewModel: CollectionsContentViewModel())
    }
}
