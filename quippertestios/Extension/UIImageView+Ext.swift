//
//  UIImage+Ext.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
        func loadImageUrl(_ url: String, placeholder: String = "ic_auto2000") {
            self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeholder), options: [.continueInBackground])
        }
}
