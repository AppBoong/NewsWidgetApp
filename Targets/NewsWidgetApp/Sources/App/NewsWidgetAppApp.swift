import SwiftUI
import ComposableArchitecture

@main
struct NewsWidgetAppApp: App {
    init() {
        let state = NewsSearch.State()
        
        store = StoreOf<NewsSearch>(initialState:state) {
            NewsSearch()
        }
    }
    
    
    let store: StoreOf<NewsSearch>
    
    var body: some Scene {
        WindowGroup {
            NewsView(store: store)
        }
    }
}
