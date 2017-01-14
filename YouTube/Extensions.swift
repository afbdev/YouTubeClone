//
//  Extensions.swift
//  YouTube
//
//  Created by afbdev on 1/14/17.
//  Copyright © 2017 afbdev. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

// video 1/20, 21:00
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String) {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respons, error) in
            if error != nil {
                print(error)
                return
            }
            // video 4/20, 20:00
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }).resume()
    }
    
}
