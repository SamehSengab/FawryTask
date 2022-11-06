//
//  NewsInteractor.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import Foundation


protocol NewsInteractorProtocol {
    func getList()
    func configureCell(cell: NewsCellProtocol, index: Int)
    var numberOfItems: Int { get }
}
protocol NewsPassingData {
    var article: [Article] { get }
}

class NewsInteractor {
    let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-10-05&sortBy=publishedAt&apiKey=0beca102432845088fb5d5f2db4a5889")
    var articleArray: [ArticlModelData] = []
    var article: [Article] = []
    let presenter: NewsPresenterProtocol?
    let network: NetworkApiProtocol?
    init(network: NetworkApiProtocol, presenter: NewsPresenterProtocol?) {
        self.network = network
        self.presenter = presenter
    }
}

extension NewsInteractor: NewsInteractorProtocol {
    
    func configureCell(cell: NewsCellProtocol, index: Int) {
        cell.displayContent(content: article[index].title ?? "")
        cell.displayImage(image:  article[index].urlToImage ?? "")
       
    }
    
    var numberOfItems: Int {
        return article.count
    }
    
    func getList() {
        network?.request(url: url, expecting: ArticlModelData.self, completion: { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data ):
                self.articleArray.append(data)
                guard let news = data.articles else {return}
                self.article.append(contentsOf: news)
                print(news)
                self.presenter?.successFullyDataFetch()
            case .failure(let error):
                print(error)
            }
        })
    }
    
    
}
extension NewsInteractor: NewsPassingData {
}
