//
//  Exnteniosn.swift
//  POCO2One
//
//  Created by ASHWANI  KUMAR on 27/02/20.
//  Copyright © 2020 ASHWANI  KUMAR. All rights reserved.
//

import UIKit

extension UIImageView {
public func imageFromServerURL(urlString: String) {
    let imageCache = NSCache<NSString, UIImage>() // caching images with url key
    if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
        self.image = cachedImage
        return
    }
    self.image = nil
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

        if error != nil {
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            imageCache.setObject(image!, forKey: NSString(string: urlString))
            self.image = image
        })

    }).resume()
}}
