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
    @StateObject var tagViewModel = TagViewModel()
    
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
                            print(#fileID, #function, #line, "- ")
                        }
                }
                .padding()
                .frame(height: 44)
                .background(Color.init(uiColor: UIColor().getSearchViewBackgroundColor()))
                .cornerRadius(6)
                
                VStack(alignment: .leading) {
                    Text("추천 키워드")
                        .font(Font.custom("NanumGothic-Bold", size: 16))
                    
                    TagViewController()
                        .getRepresentable(vm: tagViewModel)
                }
                .frame(height: 150)
                
                Text("인기 검색어")
                    .font(Font.custom("NanumGothic-Bold", size: 16))

                ForEach(tagViewModel.selectedTag) { (keyword) in
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
