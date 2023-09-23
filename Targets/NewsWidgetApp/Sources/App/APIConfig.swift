//
//  APIConfig.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/22.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import Foundation

struct APIConfig {
    static let clientID = ProcessInfo.processInfo.environment["CLIENT_ID"]
    static let cliecntSecret = ProcessInfo.processInfo.environment["CLIENT_SECRET"]
}
