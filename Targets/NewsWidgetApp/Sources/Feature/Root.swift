//
//  Root.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/21.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct Root: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .binding(_):
                return .none
            }
        }
    }
}
