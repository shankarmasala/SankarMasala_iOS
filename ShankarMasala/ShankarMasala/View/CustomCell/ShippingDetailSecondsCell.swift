//
//  ShippingDetailSecondsCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 23/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ShippingDetailSecondsCell: UITableViewCell {

    @IBOutlet weak var lblCityname: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var lblAbovePurchase: UILabel!
    @IBOutlet weak var lblNoChargePurchase: UILabel!
    
    @IBOutlet weak var viewCityname: UIView!
    @IBOutlet weak var viewWeight: UIView!
    @IBOutlet weak var viewCost: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setData(shpp : ShippingMethods) {
        lblCityname.text = shpp.city_name
        lblWeight.text = shpp.weight
        lblCost.text = "\(String(describing: shpp.min_amt_for_free_shipping!))"
        lblAbovePurchase.text = "\(String(describing: shpp.before_free_shipping_amount!))"
        lblNoChargePurchase.text = "\(String(describing: shpp.after_free_shipping_amount!))"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
