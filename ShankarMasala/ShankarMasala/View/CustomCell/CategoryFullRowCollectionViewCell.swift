//
//  CategoryFullRowCollectionViewCell.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 21/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit
import SDWebImage
class CategoryFullRowCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblBottomTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var newIcon: UIImageView!
    func setData(cate : Categori) {
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 0.5
        
        lblTitle.text = cate.category_gujarati_name
        lblSubTitle.text = cate.category_name
        newIcon.isHidden = true
        lblBottomTitle.text = "Over \(String(describing: cate.count!)) Varieties"
        if cate.isNew == 1 {
            newIcon.isHidden = false
        }
        if (cate.image?.count)! > 0 {
            let imagename = cate.image?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = kBaseUrl + kCategoryImageLoad + imagename!
            imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
extension String {
    func safeAddingPercentEncoding(withAllowedCharacters allowedCharacters: CharacterSet) -> String? {
        // using a copy to workaround magic: https://stackoverflow.com/q/44754996/1033581
        let allowedCharacters = CharacterSet(bitmapRepresentation: allowedCharacters.bitmapRepresentation)
        return addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}
