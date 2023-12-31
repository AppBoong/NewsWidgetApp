//
//  NewsStore.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/23.
//  Copyright © 2023 com.Appboong. All rights reserved.
//
import Foundation
import ComposableArchitecture


struct NewsSearch: Reducer {
  
    struct State: Equatable {
        var searchText = ""
        var total = 0
        var newsList: [News.Item] = []
        var error: NewsSearchError?
        var isLoading = false
    }
    
    enum Action: Equatable {
        case searchTextChanged(String)
        case searchTextChangedDebounced
        case requestSearch
        case searchResponse(TaskResult<News>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .searchTextChanged(let searchText):
                state.searchText = searchText
                state.newsList = []
                return .cancel(id: "searchTextChanged")
                
            case .searchTextChangedDebounced:
                guard !state.searchText.isEmpty else {
                    return .none
                }
                state.isLoading = true
                return .run { send in
                    await send(.requestSearch)
                }
                .cancellable(id: "searchTextChanged")
            case .requestSearch:
                return searchRequest(state: &state, text: state.searchText)
                
            case .searchResponse(.success(let result)):
                state.newsList = result.items
                state.isLoading = false
                return .none
                
            case .searchResponse(.failure(let error)):
                state.error = error.asAppError()
                state.newsList = []
                state.isLoading = false
                return .none
            
            }
        }
    }
    
    private func searchRequest(state: inout State, text: String) -> Effect<Action> {
      state.newsList = []
      guard !state.searchText.isEmpty else {
        return .none
      }
      state.isLoading = true
      return .run { send in
          await send(.searchResponse(
            TaskResult { try await fetchSearchNews(searchText: text, display: 20)}
          ))
        }
    }
    
    private func fetchSearchNews(searchText: String, display: Int) async throws -> News {
        
        try await NetworkServices.shared.fetchNews(request: .init(query: searchText, display: display, start: 1), method: .GET)
        
    }
    
}
