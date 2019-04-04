//
//  CustomView.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 16/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.height/2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.red.cgColor
        self.clipsToBounds = true
    }

}
