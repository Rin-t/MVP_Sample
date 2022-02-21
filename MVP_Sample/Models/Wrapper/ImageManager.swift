//
//  ImageManager.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/19.
//

import SDWebImage
import UIKit

struct ImageManager {

    static func setImage(target: UIImageView, url: URL?) {
        target.sd_setImage(with: url, completed: nil)
    }
}
