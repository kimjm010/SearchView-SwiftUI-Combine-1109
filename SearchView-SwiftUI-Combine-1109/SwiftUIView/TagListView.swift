//
//  TagListView.swift
//  SearchView-SwiftUI-Combine-1109
//
//  Created by Chris Kim on 11/10/22.
//

import SwiftUI
import TagLayoutView

struct TagListView: View {
    
    var tags: [String] = ["빡코딩", "코딩", "오늘도 빡코딩", "할라피뇨", "코딩", "빡코딩", "버거킹", "돈까스", "치즈", "오므라이스", "핫도그", "아이스 아메리카노"]
    
    var body: some View {
        GeometryReader { geometry in
            TagLayoutView(tags,
                          tagFont: UIFont.init(name: "NanumGothic", size: 12) ?? .systemFont(ofSize: 12),
                          padding: 20,
                          parentWidth: geometry.size.width) { tag in
                Text(tag)
                    .fixedSize()
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                    .foregroundColor(Color.init(uiColor: UIColor().getKeywordsColor()))
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.init(uiColor: UIColor().getKeywordBorderColor()), lineWidth: 2.0))
            }
        }
        
    }
}

struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        TagListView()
    }
}
