//
//  MenuViewCell.swift
//  Transport
//
//  Created by Samir on 06/02/19.
//  Copyright © 2019 Samir Khatri. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var lblMobile_number: UILabel!

    @IBOutlet weak var vwCell: UIView!
    @IBOutlet weak var lblMenuTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
