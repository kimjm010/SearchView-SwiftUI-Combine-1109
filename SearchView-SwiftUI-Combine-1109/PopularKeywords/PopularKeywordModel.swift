//
//  PopularKeywordModel.swift
//  DailyMission-SearchView-1
//
//  Created by Chris Kim on 11/10/22.
//

import Foundation


struct PopularKeyword: Identifiable {
    let id = UUID()
    let keyword: String
}


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

