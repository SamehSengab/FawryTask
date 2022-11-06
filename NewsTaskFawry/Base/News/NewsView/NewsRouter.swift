//
//  NewsRouter.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 06/11/2022.
//

import Foundation
protocol NewsRoutingLogic {
    func routeToDetails(index: Int)
}
protocol NewsStoreData {
    var dataStore: NewsPassingData? { get }
}


class NewsRouter {
    weak var viewController: NewsViewController?
    var dataStore: NewsPassingData?
    init(viewController: NewsViewController) {
        self.viewController = viewController
    }
}

extension NewsRouter: NewsRoutingLogic {
    func routeToDetails(index: Int) {
        guard let model = dataStore?.article[index] else {return}
        let view = NewsConfigrator.details(model: model)
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
extension NewsRouter: NewsStoreData {
}
