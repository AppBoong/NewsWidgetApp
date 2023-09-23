//
//  NewsStore.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/23.
//  Copyright © 2023 com.Appboong. All rights reserved.
//
import ComposableArchitecture


struct NewsSearch: Reducer {
  
    struct State: Equatable {
        var searchText = ""
        var total = 0
        var news: [News] = []
        var error: NewsSearchError?
        var isLoading = false
    }
    
    enum Action: Equatable {
        case searchTextChanged(String)
        case searchTextDebounced
        case searchResponse(TaskResult<NewsResult>)
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .searchTextChanged(let searchText):
            state.searchText = searchText
            state.total = 0
            state.news = []
            return .cancel(id: "")
        case .searchTextDebounced:
            guard !state.searchText.isEmpty else {
                return .none
            }
            state.isLoading = true
            return 
        case .searchResponse(.success(let result)):
            state.news = result.newsList
            state.total = result.total
            state.isLoading = false
            return .none
            
        case .searchResponse(.failure(let error)):
            state.error = error.asAppError()
            state.news = []
            state.total = 0
            state.isLoading = false
            return .none
        }
    }
}
