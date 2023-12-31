//
//  NetworkService.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/22.
//  Copyright © 2023 com.Appboong. All rights reserved.
//


import Foundation

struct NetworkServices {
    static let shared = NetworkServices()
    
    private init() {}
    
    func fetchNews<T: Decodable>(request: NewsRequest, method: HTTPMethod) async throws -> T {
        let queryParams: [String:String] = [
            "query" : request.query,
            "display" : String(request.display),
            "start" : String(request.start)]
        
        var component = URLComponents(url: Endpoint.fetchNews.url, resolvingAgainstBaseURL: false)!
        component.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        var URLrequest = URLRequest(url: component.url!)
        
        URLrequest.httpMethod = method.rawValue
        
        if let clientID = APIConfig.clientID,
           let clientSecret = APIConfig.cliecntSecret {
            URLrequest.setValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
            URLrequest.setValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLrequest)
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Response JSON:")
            print(jsonString)
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}

struct NewsRequest: Encodable {
    let query: String
    let display: Int
    let start: Int
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum Endpoint {
    case fetchNews

    var url: URL {
        switch self {
        case .fetchNews:
            return URL(string: "https://openapi.naver.com/v1/search/news.json")!
        }
    }
}
