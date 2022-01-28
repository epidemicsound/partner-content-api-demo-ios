import SwiftUI

struct CollectionsContentView: View {
    @State var viewModel = CollectionsContentViewModel()
    
    var body: some View {
        Text(viewModel.content)
    }
}

struct CollectionsContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsContentView()
    }
}
