//
//  ProductDesciptionVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 14/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ProductDesciptionVC: UIViewController {

    var pro : Product?
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    
    class func initViewController(product : Product) -> ProductDesciptionVC{
        let vc = ProductDesciptionVC(nibName: "ProductDesciptionVC", bundle: nil)
        vc.pro = product
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = pro?.product_name
        lblDesc.text = pro?.product_description
    }
    

}
