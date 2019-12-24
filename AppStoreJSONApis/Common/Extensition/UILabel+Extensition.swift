//
//  UILabel+Extensition.swift
//  SA for iOS
//
//  Created by 안관수 on 23/10/2019.
//  Copyright © 2019 안관수. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(font: UIFont, color: UIColor, text: String = "dummy data") {
        self.init()
        self.font = font
        self.textColor = color
        self.text = text
    }
}
