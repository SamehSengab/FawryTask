//
//  NewsPresenter.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 06/11/2022.
//

import Foundation
protocol NewsPresenterProtocol {
    func successFullyDataFetch()
}


class NewsPresenter {
    let view: NewsViewControllerProtocl?
    init(view: NewsViewControllerProtocl?) {
        self.view = view
    }
}

extension NewsPresenter: NewsPresenterProtocol {
    func successFullyDataFetch() {
        view?.successFullyData()
    }
    
    
}
