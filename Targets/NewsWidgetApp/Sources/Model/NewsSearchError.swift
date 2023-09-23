//
//  NewsError.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/23.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import Foundation

enum NewsSearchError: Error, Equatable {
    case networkError
    case unknown
}

extension Error {
    func asAppError() -> NewsSearchError {
        return self as? NewsSearchError ?? .unknown
    }
}

extension NewsSearchError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "네트워크 오류"
        case .unknown:
            return "알 수 없는 오류"
        }
    }
}
