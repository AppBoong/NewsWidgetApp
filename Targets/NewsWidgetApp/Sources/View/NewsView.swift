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
            ZStack {
               
                List(viewStore.newsList) { item in
                   
                    VStack {
                        Spacer()
                            .frame(height: 40)
                        NewsRow(news: item)
                    }
                }
                
                GeometryReader { geo in
                    SearchBar(placeholder: "검색어를 입력해주세요.",
                              text: viewStore.binding(
                                get: \.searchText,
                                send: {.searchTextChanged($0)})
                    ) {
                        print(viewStore.state.isLoading)
                        viewStore.send(.requestSearch)
                    }
                    .position(x: (geo.size.width - 40) / 2, y: -5)
                    .padding(20)
                }
                
                
            }
            .navigationTitle("News")
        }
    }
}


