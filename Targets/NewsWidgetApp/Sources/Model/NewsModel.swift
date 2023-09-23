//
//  NewsModel.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/23.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import Foundation

struct News: Decodable {
    let channel: Channel

    struct Channel: Decodable {
        let title: String
        let link: String
        let description: String
        let lastBuildDate: String
        let total: String
        let start: String
        let display: String
        let items: [Item]

        struct Item: Decodable {
            let title: String
            let originalLink: String
            let link: String
            let description: String
            let pubDate: String

            enum CodingKeys: String, CodingKey {
                case title
                case originalLink = "originallink"
                case link
                case description
                case pubDate
            }
        }
    }
}