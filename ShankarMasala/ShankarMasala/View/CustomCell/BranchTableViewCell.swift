//
//  BranchTableViewCell.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 02/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class BranchTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgSelection: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblContactNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
