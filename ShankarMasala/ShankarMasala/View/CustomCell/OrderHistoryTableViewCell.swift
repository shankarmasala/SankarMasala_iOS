//
//  OrderHistoryTableViewCell.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 04/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPacking: UILabel!
    @IBOutlet weak var lblMRP: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
