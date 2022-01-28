import SwiftUI

@main
struct DemoApp: App {

    init() {
        // Format navigation bar appearance
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().tintColor = UIColor.white
    }

    var viewModel = CollectionsContentViewModel()
    var body: some Scene {
        WindowGroup {
            CollectionsContentView(viewModel: viewModel)
        }
    }
}
