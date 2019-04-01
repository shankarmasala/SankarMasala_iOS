//
//  OrderProductCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 21/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderProductCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGm: UILabel!
    @IBOutlet weak var lblMrp: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var subView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCellData() {
        self.subView.layer.borderColor = UIColor(red: 253.0/255.0, green: 254.0/255.0, blue: 138.0/255.0, alpha: 1.0).cgColor
        self.subView.layer.borderWidth = 2
        self.subView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
