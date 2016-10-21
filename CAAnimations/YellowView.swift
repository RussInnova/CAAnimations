//
//  yellowView.swift
//  CAAnimations
//
//  Created by Keith Russell on 7/23/16.
//  Copyright © 2016 Keith Russell. All rights reserved.
//

import UIKit

class YellowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.yellow
        layer.cornerRadius = 7.5
    }
}
