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
        var news: [News] = []
        var error: NewsSearchError?
        var isLoading = false
    }
    
    enum Action: Equatable {
        case searchTextChanged(String)
        case requestSearch
        case searchResponse(TaskResult<NewsResult>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .searchTextChanged(let searchText):
                state.searchText = searchText
                state.total = 0
                state.news = []
                return .run { send in
                    await send(.requestSearch)
                }
                
            case .requestSearch:
                return searchRequest(state: &state, text: state.searchText)
                
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
    
    private func searchRequest(state: inout State, text: String) -> Effect<Action> {
      state.news = []
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
    
    private func fetchSearchNews(searchText: String, display: Int) async throws -> NewsResult {
        try await NetworkServices.shared.fetchNews(request: .init(query: searchText, display: display, start: 0), method: .GET)
    }
    
}
