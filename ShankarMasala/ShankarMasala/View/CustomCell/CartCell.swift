//
//  CartCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 23/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGm: UILabel!
    @IBOutlet weak var lblMrp: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var subView: UIView!

    
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnDropDown: UIButton!
    
    @IBOutlet weak var gmView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCellData(c: Cart) {
        self.subView.layer.borderColor = UIColor(red: 253.0/255.0, green: 254.0/255.0, blue: 138.0/255.0, alpha: 1.0).cgColor
        self.subView.layer.borderWidth = 1
        self.subView.clipsToBounds = true
        lblTitle.text = c.product?.product_name
        lblQty.text = "\(c.qty?.intValue ?? 0)"
        lblGm.text = "\(c.productAttribute?.weight ?? "0") \(c.productAttribute?.unit ?? "gm")"
        let mrp : Int = (c.productAttribute?.mrp?.intValue)!
        lblMrp.text = "MRP : Rs.\(mrp * (c.qty?.intValue)!)"
        
        let offerPrice : Int = (c.productAttribute?.selling_price?.intValue)!
        lblOfferPrice.text = "Offer Price : Rs.\(offerPrice * (c.qty?.intValue)!)"
        btnMinus.layer.borderColor = UIColor.black.cgColor
        btnPlus.layer.borderColor = UIColor.black.cgColor
        btnMinus.layer.borderWidth = 1.0
        btnPlus.layer.borderWidth = 1.0
        gmView.layer.borderColor = UIColor.black.cgColor
        gmView.layer.borderWidth = 1.0
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
