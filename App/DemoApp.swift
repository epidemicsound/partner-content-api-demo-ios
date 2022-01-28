import SwiftUI

@main
struct DemoApp: App {
    var viewModel = CollectionsContentViewModel()
    var body: some Scene {
        WindowGroup {
            CollectionsContentView()
                .environmentObject(viewModel)
        }
    }
}
