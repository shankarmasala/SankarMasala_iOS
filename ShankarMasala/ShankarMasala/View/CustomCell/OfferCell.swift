//
//  OfferCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 28/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OfferCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGujratiTitle: UILabel!
    @IBOutlet weak var lblGm: UILabel!
    @IBOutlet weak var lblMrp: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblSave: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var subView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subView.layer.borderColor = UIColor(red: 253.0/255.0, green: 254.0/255.0, blue: 138.0/255.0, alpha: 1.0).cgColor
        self.subView.layer.borderWidth = 1
        self.subView.clipsToBounds = true
        // Initialization code
    }
    
    func setData(pro : Product) {
//        self.contentView.layer.borderColor = UIColor.gray.cgColor
//        self.contentView.layer.borderWidth = 0.5
//        self.contentView.clipsToBounds = true
        
        lblTitle.text = pro.product_name
        lblGujratiTitle.text = pro.product_gujarati_name
        if pro.product_attribute.count > 0 {
            let attributes =  pro.product_attribute.allObjects
            let att : ProductAttribute = attributes[0] as! ProductAttribute
            lblGm.text = "Packing : \(att.weight ?? "") \(att.unit ?? "")"
            lblMrp.text = "MRP : RS \(att.selling_price?.floatValue ?? 0)"
            lblOfferPrice.text = "Offer Price : RS \(att.mrp?.floatValue ?? 0)"
        }
        
        // newIcon.isHidden = true
        // if cate.isNew == 1 {
        //     newIcon.isHidden = false
        // }
        if (pro.image1?.count)! > 0 {
            let imagename = pro.image1?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = kBaseUrl + kProductImageLoad + imagename!
            imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        }
        
        //  let url = kBaseUrl + kProductImageLoad + pro.image1!
        // imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        
        
        // let url = URL(string: "http://mywebsitedemo.biz/cakephp/shankarmasala/product/FLAXSEEDS%20ROASTED_image1%20(03-07-2018%2008%2016%2018).jpg")
        //imgView.kf.setImage(with: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
