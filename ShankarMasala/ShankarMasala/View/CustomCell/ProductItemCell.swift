//
//  ProductItemCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 24/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ProductItemCell: UITableViewCell {

    @IBOutlet weak var lblPacking: UILabel!
    @IBOutlet weak var lblMRP: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnTitle: UIButton!
    @IBOutlet weak var btnCheckMark: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellData(att : ProductAttribute)  {
        lblMRP.text = "Rs \(att.mrp?.floatValue ?? 0)"
        lblOfferPrice.text = "Rs \(att.selling_price?.floatValue ?? 0)"
        lblPacking.text = "\(String(describing: att.weight!)) \(String(describing: att.unit!))"
        
        let lineView = UIView(
            frame: CGRect(x: 0,
                          y: lblMRP.bounds.size.height / 2,
                          width: lblMRP.bounds.size.width,
                          height: 1
            )
        )
        lineView.backgroundColor = UIColor.red
        lblMRP.addSubview(lineView)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
