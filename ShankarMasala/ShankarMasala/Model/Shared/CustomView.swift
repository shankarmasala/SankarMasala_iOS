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
        layer.cornerRadius = 18
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 225.0/255.0, green: 62.0/255.0, blue: 67.0/255.0, alpha: 1.0).cgColor
        self.clipsToBounds = true
    }

}
