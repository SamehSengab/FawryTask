//
//  NewsConfigrator.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import Foundation
import UIKit
enum NewsConfigrator {
    static func newsView() -> UIViewController {
        let network = NetworkApi()
        let view = NewsViewController()
        let presenter = NewsPresenter(view: view)
        let interactor = NewsInteractor(network: network, presenter: presenter)
        let router = NewsRouter(viewController: view)
        view.router = router
        view.interactor = interactor
        router.dataStore = interactor
        return view
    }
    static func details(model: Article) -> UIViewController {
        let view = DetailsViewController(viewModel: .init(model: model))
        return view
    }
}
