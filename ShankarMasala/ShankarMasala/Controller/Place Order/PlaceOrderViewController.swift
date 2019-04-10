//
//  PlaceOrderViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 03/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

import PlugNPlay

class PlaceOrderViewController: BaseVC {

    @IBOutlet weak var viewCouponCode: UIView!
    @IBOutlet weak var viewConfirmationPopup: UIView!
    
    @IBOutlet weak var btnPayOnStore: UIButton!
    @IBOutlet weak var btnPayOnline: UIButton!
    
    @IBOutlet weak var txtViewComment: UITextView!
    
    @IBOutlet weak var lblNetAmount: UILabel!
    @IBOutlet weak var lblShippingCharge: UILabel!
    
    @IBOutlet weak var txtCouponCode: UITextField!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    var dictOrderInfo : [String:Any] = [String:Any]()
    
    class func initViewController() -> PlaceOrderViewController{
        let vc = PlaceOrderViewController(nibName: "PlaceOrderViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCouponCode.isHidden = true
        
        lblNetAmount.text = "\(Cart.getTotal())"
        lblShippingCharge.text = ""
        txtViewComment.delegate = self
        lblTotalAmount.text = "\(Cart.getTotal())"
        // Do any additional setup after loading the view.
    }

    @IBAction func actionApplyCouponCode(_ sender: Any) {
        
        viewCouponCode.isHidden = false
        
    }
    
    
    @IBAction func placeOrder(_ sender: UIButton) {
        self.view.endEditing(true)
        viewConfirmationPopup.isHidden = false
    }
    
    @IBAction func actionOk(_ sender: Any) {
        
        viewConfirmationPopup.isHidden = true
        
        if txtViewComment.text.count > 0 && txtViewComment.text != "Comment...."{
            dictOrderInfo["Comment"] = txtViewComment.text!
        }
        
        if txtCouponCode.text!.count > 0{
            dictOrderInfo["CouponCode"] = txtCouponCode.text!
        }
        
        if btnPayOnStore.isSelected == true{
            dictOrderInfo["PaymentType"] = "PayOnStore"
            
            let orderHistortyViewController = OrderHistoryProductListViewController.initViewController()
            orderHistortyViewController.dictOrderInfo = dictOrderInfo
            self.navigationController?.pushViewController(orderHistortyViewController, animated: true)
            
        }else{
            dictOrderInfo["PaymentType"] = "PayOnline"
            
            let dict : PUMTxnParam = PUMTxnParam()
            dict.amount = "\(Cart.getTotal())"
            dict.phone = dictOrderInfo["PhoneNumber"] as? String ?? ""
            dict.email = dictOrderInfo["EmailId"] as? String ?? ""
            dict.environment = .test
            dict.firstname = dictOrderInfo["FirstName"] as? String ?? ""
            dict.key = "CBg72i"
            dict.merchantid = "5312984"
            dict.hashValue = "gkFdK0QB"
            dict.txnID = "12321"
            
            PlugNPlay.presentPaymentViewController(withTxnParams: dict, on: self) { (responnse, error, extraParams) in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    print(responnse)
                    print(extraParams)
                }
            }
            
        }
    }
    
    @IBAction func actionNo(_ sender: Any) {
        viewConfirmationPopup.isHidden = true;
    }
    
    @IBAction func btnPayOnlineClicked(_ sender: Any) {
        btnPayOnStore.isSelected = false
        btnPayOnline.isSelected = true
    }
    
    @IBAction func btnPayOnStoreClicked(_ sender: Any) {
        btnPayOnline.isSelected = false
        btnPayOnStore.isSelected = true
    }
}

extension PlaceOrderViewController : UITextViewDelegate{
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        if textView.text == "Comment...."{
            textView.text = ""
        }
    
        return true
    }
    
    func textViewDidChange(_ textView: UITextView){
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.text = "Comment...."
        }
    }
    
}
