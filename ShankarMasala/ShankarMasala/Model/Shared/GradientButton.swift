//
//  GradientButton.swift
//  AlamofireDemo
//
//  Created by Samir Khatri on 08/09/17.
//  Copyright © 2017 Samir Khatri. All rights reserved.
//

import UIKit

class GradientButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = false
        layer.cornerRadius = self.frame.size.height / 2
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        gradient.colors = [
            UIColor(red:30.0/255.0, green:228.0/255.0, blue:239.0/255.0, alpha:1).cgColor,
            UIColor(red:24.0/255.0, green:229.0/255.0, blue:225.0/255.0, alpha:1).cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.03, y: 0.39)
        gradient.endPoint = CGPoint(x: 0.97, y: 0.5)
        gradient.cornerRadius = 10
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
