//
//  SalesInvoiceTableViewCell.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 06/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class SalesInvoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
