//
//  ContentView.swift
//  SearchView-SwiftUI-Combine-1109
//
//  Created by Chris Kim on 11/10/22.
//

import SwiftUI
import TagLayoutView

struct PopularKeyword: Identifiable {
    let id = UUID()
    let keyword: String
}


struct ContentView: View {
    @State private var searchedText: String = ""
    
    var popularKeywords: [PopularKeyword] = [
        PopularKeyword(keyword: "빡코딩"),
        PopularKeyword(keyword: "오늘도 빡코딩"),
        PopularKeyword(keyword: "버거킹"),
        PopularKeyword(keyword: "오므라이스"),
        PopularKeyword(keyword: "핫도그"),
        PopularKeyword(keyword: "아이스크림"),
        PopularKeyword(keyword: "치즈"),
        PopularKeyword(keyword: "빡코딩"),
        
        PopularKeyword(keyword: "빡코딩"),
        PopularKeyword(keyword: "오늘도 빡코딩"),
        PopularKeyword(keyword: "버거킹"),
        PopularKeyword(keyword: "오므라이스"),
        PopularKeyword(keyword: "핫도그"),
        PopularKeyword(keyword: "아이스크림"),
        PopularKeyword(keyword: "치즈"),
        PopularKeyword(keyword: "빡코딩"),
        
        PopularKeyword(keyword: "빡코딩"),
        PopularKeyword(keyword: "오늘도 빡코딩")
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 16) {
                Text("검색")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.init(uiColor: UIColor().getSearchImageColor()))
                    
                    TextField("Search", text: $searchedText, prompt: Text("아이템을 검색해 보세요"))
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .submitLabel(.search)
                        .onSubmit {
                            #warning("Todo: - 검색기능 구현")
                        }
                }
                .padding()
                .frame(height: 44)
                .background(Color.init(uiColor: UIColor().getSearchViewBackgroundColor()))
                .cornerRadius(6)
                
                
                Text("추천 키워드")
                    .font(Font.custom("NanumGothic-Bold", size: 16))
                
                TagListView()
                    .frame(height: 120)
                
                
                Text("인기 검색어")
                    .font(Font.custom("NanumGothic-Bold", size: 16))

                ForEach(popularKeywords) { (keyword) in
                    Text(keyword.keyword)
                        .font(Font.custom("NanumGothic-Regular", size: 12))
                        .foregroundColor(Color.init(uiColor: UIColor().getKeywordsColor()))
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
