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
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List(viewStore.state.news) { newsItem in
                Text(newsItem.channel.title)
                   }
                   .onAppear {
                       viewStore.send(.searchResponse(<#T##TaskResult<NewsResult>#>))
                   }
                   .overlay(
                       ProgressView()
                        .opacity(viewStore.isLoading ? 1 : 0)
                   )
               }
    }
}
