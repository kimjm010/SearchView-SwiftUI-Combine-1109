//
//  TagViewModel.swift
//  SearchView-SwiftUI-Combine-1109
//
//  Created by Chris Kim on 11/10/22.
//

import TagListView
import Foundation
import SwiftUI
import Combine


struct PopularTag: Identifiable {
    let id = UUID()
    let keyword: String
}


class TagViewModel: ObservableObject {
    
    @Published var selectedTag = [
        PopularTag(keyword: "빡코딩"),
        PopularTag(keyword: "오늘도 빡코딩"),
        PopularTag(keyword: "버거킹"),
        PopularTag(keyword: "오므라이스"),
        PopularTag(keyword: "핫도그"),
        PopularTag(keyword: "아이스크림"),
        PopularTag(keyword: "치즈"),
        PopularTag(keyword: "빡코딩"),
        
        PopularTag(keyword: "빡코딩"),
        PopularTag(keyword: "오늘도 빡코딩"),
        PopularTag(keyword: "버거킹"),
        PopularTag(keyword: "오므라이스"),
        PopularTag(keyword: "핫도그"),
        PopularTag(keyword: "아이스크림"),
        PopularTag(keyword: "치즈"),
        PopularTag(keyword: "빡코딩"),
        
        PopularTag(keyword: "빡코딩"),
        PopularTag(keyword: "오늘도 빡코딩")
    ]
    
    
    @Published var recommendationKeywords = ["빡코딩", "코딩", "오늘도 빡코딩", "할라피뇨", "코딩", "빡코딩", "버거킹", "돈까스", "치즈", "오므라이스", "핫도그", "아이스 아메리카노"]
    
    // MARK: - Inputs
    // 선택된 tagView
    
    // MARK: - OutPuts
    // TagView 배열
    
    init() {
        print(#fileID, #function, #line, "- ")
    }
    
    
    /// Add Tag View
    /// - Parameter title: TagView Title
    func addTagView(with title: String) {
        print(#fileID, #function, #line, "-didSelectTagView: \(title)")
        recommendationKeywords.append(title)
    }
    
    
    /// Remove TagView
    /// - Parameter tagView: Removed Tagview
    func removeTagView(_ tagView: TagView, title: String) {
        print(#fileID, #function, #line, "-removeTagView: \(tagView) \(title)")
    }
    
    
    func didSelectTagView(_ tagView: TagView) {
        print(#fileID, #function, #line, "-didSelectTagView: \(tagView)")
    }
}
