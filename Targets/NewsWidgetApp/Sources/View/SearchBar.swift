//
//  SearchBar.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/25.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
  var placeholder: String
  @Binding var text: String
  var onCommit: () -> Void = { }
  
  @Environment(\.colorSystem) private var colorSystem
  
  var body: some View {
    HStack {
      searchIcon
      textField
      if !text.isEmpty {
        xButton
      }
    }
    .padding(5)
    ._background {
      colorSystem.surfaceSecondary
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
  }
  
  private var searchIcon: some View {
    Image(systemName: "magnifyingglass")
      .foregroundColor(colorSystem.textSecondary)
  }
  
  private var textField: some View {
    TextField(
      placeholder,
      text: $text,
      onCommit: {
        onCommit()
      }
    )
    .foregroundColor(colorSystem.textPrimary)
  }
  
  private var xButton: some View {
    Button {
      text = ""
    } label: {
      Image(systemName: "xmark.circle.fill")
        .foregroundColor(colorSystem.textSecondary)
    }
  }
}

