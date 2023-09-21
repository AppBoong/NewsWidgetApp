import SwiftUI
import ComposableArchitecture

@main
struct NewsWidgetAppApp: App {
    init() {
        let rootState = Root.State()
        
        store = StoreOf<Root>(initialState:rootState) {
            Root()
        }
    }
    
    
    let store: StoreOf<Root>
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
