//
//  NewsModel.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import Foundation
struct ArticlModelData: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
 
    }
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
// MARK: - ViewModelCell
struct NewsViewModel {
    var image: String
    var descreption: String
    init(model: Article) {
        self.image = model.urlToImage ?? ""
        self.descreption = model.articleDescription ?? ""
    }
}
