//
//  MainView.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/20.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                NewsRow()
                NewsRow()
                NewsRow()
                NewsRow()
                NewsRow()
                NewsRow()
            }
            .navigationTitle("News")
        }
    }
}
