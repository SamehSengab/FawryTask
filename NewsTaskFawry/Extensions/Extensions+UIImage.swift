//
//  Extensions+UIImage.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import UIKit
var imageCash = NSCache<AnyObject,AnyObject>()
extension UIImageView {
    
    func load(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        if let image = imageCash.object(forKey: urlString as  NSString) as? UIImage {
            self.image = image
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        imageCash.setObject(image, forKey: urlString as  NSString)
                        self?.image = image
                        
                    }
                }
            }
        }
    }
}
