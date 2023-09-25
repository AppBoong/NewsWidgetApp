//
//  NewsModel.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/23.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import Foundation

struct News: Decodable, Equatable {
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]

    struct Item: Decodable, Equatable {
        let title: String
        let originallink: String
        let link: String
        let description: String
        let pubDate: String
    }
}
