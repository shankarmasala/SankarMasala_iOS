//
//  ProductCollectionViewCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 21/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit
import SDWebImage
class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCutPrice: UILabel!
    @IBOutlet weak var lblgm: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var newIcon: UIImageView!
    
    func setData(pro : Product) {
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.borderWidth = 0.5
        self.contentView.clipsToBounds = true
        
        lblTitle.text = pro.product_gujarati_name
        lblSubTitle.text = pro.product_name
        if pro.product_attribute.count > 0 {
            let attributes =  pro.product_attribute.allObjects
            let att : ProductAttribute = attributes[0] as! ProductAttribute
            lblgm.text = "\(att.weight ?? "") \(att.unit ?? "")"
            lblPrice.text = "RS \(att.selling_price?.floatValue ?? 0)"
            lblCutPrice.text = "RS \(att.mrp?.floatValue ?? 0)"
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
