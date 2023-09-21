//
//  NewsRow.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/21.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
    
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "person")
            VStack {
                Text("news")
                Text("2023-11-18")
            }
            Spacer()
        }
    }
}
