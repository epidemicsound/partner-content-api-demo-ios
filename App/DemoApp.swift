import SwiftUI

@main
struct DemoApp: App {

    init() {
        // Format navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.white
    }

    var viewModel = CollectionsContentViewModel()
    var body: some Scene {
        WindowGroup {
            CollectionsContentView(viewModel: viewModel)
        }
    }
}
