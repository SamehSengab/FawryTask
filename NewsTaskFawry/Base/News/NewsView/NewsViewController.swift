//
//  NewsViewController.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import UIKit
protocol NewsViewControllerProtocl  {
    func successFullyData()
}

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib(nibName: "NewsCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        }
    }
    var router: NewsRoutingLogic?
    var interactor: NewsInteractorProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getList()
    }
}

extension NewsViewController: UITableViewDataSource,
                              UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.numberOfItems ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell")
                as! NewsCell
        interactor?.configureCell(cell: cell, index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetails(index: indexPath.row)
    }
}

extension NewsViewController: NewsViewControllerProtocl {
    func successFullyData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       
    }
}
