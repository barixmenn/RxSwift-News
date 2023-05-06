//
//  Article.swift
//  RxSwift-News
//
//  Created by Baris on 7.05.2023.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
