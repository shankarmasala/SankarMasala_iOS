//
//  BottomView.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 15/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class BottomView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btn: UIButton!
    
    class func instanceFromNib() -> BottomView {
        return UINib(nibName: "BottomView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BottomView
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
