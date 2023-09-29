//
//  NewsRow.swift
//  NewsWidgetApp
//
//  Created by 이재열 on 2023/09/21.
//  Copyright © 2023 com.Appboong. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
    
    var news: News.Item
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width:20)
         
               
            VStack(alignment: .leading) {
                
                HStack {
                    Text(news.title)
                        .lineLimit(1)
                    Spacer()
                        .frame(width: 20)
                    Text(news.pubDate)
                        .lineLimit(1)
                }
                Spacer(minLength: 10)
                Text(news.description)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
                .frame(width:20)
        }
        .frame(height: 200)
    }
}

#Preview {
    NewsRow(news: News.Item.init(title: "뉴스 제목입니다.", originallink: "zz", link: "zzzz", description: "뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. 뉴스 내용입니다. ", pubDate: "2022-02-02")
            )
}

extension String {
    func htmlToAttributedString() -> NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
        } catch {
            print("Error parsing HTML: \(error.localizedDescription)")
            return nil
        }
    }
}
