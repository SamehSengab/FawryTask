//
//  NewsCell.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import UIKit
protocol NewsCellProtocol {
    func displayImage(image: String?)
    func displayContent(content: String?)
}
class NewsCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        newsImage.layer.cornerRadius = 4
    }
//    func setupData(model: ArticlModelData) {
//        newsImage.load(urlString: model.image)
//        descriptionLabel.text = model.descreption
//        print(model,"kkkkkk")
//    }
}
extension NewsCell: NewsCellProtocol {
    func displayImage(image: String?) {
        newsImage.load(urlString: image ?? "")
    }
    
    func displayContent(content: String?) {
        descriptionLabel.text = content ?? ""
    }
    
    
}
