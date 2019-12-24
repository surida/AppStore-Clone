//
//  UIView+Extensition.swift
//  SA for iOS
//
//  Created by 안관수 on 20/05/2019.
//  Copyright © 2019 안관수. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach({ self.addSubview($0) })
    }    
}
