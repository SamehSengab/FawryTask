//
//  DetailsViewModel.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 06/11/2022.
//

import Foundation
struct DetailsViewModel {
    var auther: String?
    var title: String?
    var scourse: String?
    var image: String?
    var descreption: String?
    var url: String?
    init(model: Article) {
        self.auther = model.author
        self.title = model.title
        self.scourse = model.source?.name
        self.image = model.urlToImage
        self.descreption = model.articleDescription
        self.url = model.url
    }
}
