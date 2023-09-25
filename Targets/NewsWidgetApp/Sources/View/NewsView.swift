//
//  NewsView.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/20.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct NewsView: View {
    let store: StoreOf<NewsSearch>
    @ObservedObject var viewStore: ViewStoreOf<NewsSearch>
    
    @Environment(\.colorSystem) private var colorSystem
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(placeholder: "검색어를 입력해주세요.",
                          text: viewStore.binding(
                            get: \.searchText,
                            send: {.searchTextChanged($0)})
                ) {
                    print(viewStore.state.isLoading)
                    viewStore.send(.requestSearch)
                }
                .padding(20)
                
                
                if let news = viewStore.state.news {
                    List(news.items) { item in
                        VStack {
                            Text(item.title)
                            Text(item.description)
                        }
                    }
                }
                
                
                Spacer(minLength: 20)
            }
        }
        .navigationTitle("News")
    }
}
