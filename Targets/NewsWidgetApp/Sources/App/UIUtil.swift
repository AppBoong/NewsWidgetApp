//
//  UIUtil.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/22.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func _overlay(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> some View
    ) -> some View {
        self.overlay(content(), alignment: alignment)
    }
    
    @ViewBuilder
    func _background(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> some View
    ) -> some View {
        self.background(content(), alignment: alignment)
    }
}
