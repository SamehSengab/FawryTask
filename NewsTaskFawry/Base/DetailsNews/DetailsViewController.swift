//
//  DetailsViewController.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 06/11/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var descreptionLabel: UILabel!
    
    @IBOutlet weak var goToUrlButton: UIButton!
    var viewModel: DetailsViewModel
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        let url = UIBarButtonItem(title: "URL", style: .plain, target: self, action: #selector(playTapped))
        navigationItem.rightBarButtonItems = [url]
    }
    func setUpData() {
        newsImage.load(urlString: viewModel.image ?? "")
        titleLabel.text = viewModel.title ?? ""
        autherLabel.text = viewModel.auther ?? ""
        sourceLabel.text = viewModel.scourse ?? ""
        descreptionLabel.text = viewModel.descreption ?? ""
    }
    @objc func playTapped() {
        if let url = URL(string: viewModel.url ?? "") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    }
}
