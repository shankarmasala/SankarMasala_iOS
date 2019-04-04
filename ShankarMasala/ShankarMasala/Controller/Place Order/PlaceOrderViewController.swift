//
//  PlaceOrderViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 03/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class PlaceOrderViewController: BaseVC {

    @IBOutlet weak var viewCouponCode: UIView!
    @IBOutlet weak var viewConfirmationPopup: UIView!
    
    @IBOutlet weak var btnPayOnStore: UIButton!
    @IBOutlet weak var btnPayOnline: UIButton!
    
    @IBOutlet weak var txtViewComment: UITextView!
    
    class func initViewController() -> PlaceOrderViewController{
        let vc = PlaceOrderViewController(nibName: "PlaceOrderViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCouponCode.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func actionApplyCouponCode(_ sender: Any) {
        
        viewCouponCode.isHidden = false
        
    }
    
    
    @IBAction func placeOrder(_ sender: UIButton) {
        viewConfirmationPopup.isHidden = false
    }
    
    @IBAction func actionOk(_ sender: Any) {
        
        viewConfirmationPopup.isHidden = true
        
        let orderHistortyViewController = OrderHistoryProductListViewController.initViewController()
        self.navigationController?.pushViewController(orderHistortyViewController, animated: true)
        
    }
    
    @IBAction func actionNo(_ sender: Any) {
        viewConfirmationPopup.isHidden = true;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
