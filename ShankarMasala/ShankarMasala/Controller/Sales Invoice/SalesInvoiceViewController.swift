//
//  SalesInvoiceViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 05/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class SalesInvoiceViewController: BaseVC {

    @IBOutlet weak var imgOrderState: UIImageView!
    @IBOutlet weak var lblCustomerDetail: UILabel!
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblNetAmount: UILabel!
    @IBOutlet weak var lblTotalCharges: UILabel!
    
    @IBOutlet weak var btnDownloadPDF: UIButton!
    
    var dictOrderInfo : [String:Any] = [String:Any]()
    
    @IBOutlet weak var constrainTableHeight: NSLayoutConstraint!
    
    let arrCart : [Cart] = Cart.getAll() ?? []
    
    class func initViewController() -> SalesInvoiceViewController{
        let vc = SalesInvoiceViewController(nibName: "SalesInvoiceViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.layer.borderColor = UIColor.black.cgColor
        tblView.layer.borderWidth = 1
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: "SalesInvoiceTableViewCell", bundle: nil), forCellReuseIdentifier: "SalesInvoiceTableViewCell")
//        SalesInvoiceTableViewCell
        
        let strInfo = "\(dictOrderInfo["FirstName"] as? String ?? "") \(dictOrderInfo["LastName"] as? String ?? "")\n \(dictOrderInfo["EmailId"] as? String ?? "")\n\(dictOrderInfo["PhoneNumber"] as? String ?? "")"
        
        lblCustomerDetail.text = strInfo
        lblNetAmount.text = "\(Cart.getTotal())"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //constrainTableHeight.constant = 1000
        self.tblView.reloadData()
        
        self.tblView.layoutIfNeeded()
        
        constrainTableHeight.constant = tblView.contentSize.height
    }

    @IBAction func actionDownloadPDF(_ sender: UIButton) {
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

extension SalesInvoiceViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCart.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesInvoiceTableViewCell", for: indexPath) as! SalesInvoiceTableViewCell
        
        if indexPath.row == 0 {
            cell.lblQty.text = "Qty"
            cell.lblAmount.text = "Amount"
            cell.lblItemName.text = "Item Name"
        }else{
            
            let cart = arrCart[indexPath.row - 1]
            
            cell.lblItemName.text = cart.product?.product_name ?? ""
            
            cell.lblAmount.text = "\(cart.productAttribute!.selling_price!.intValue)"
            cell.lblQty.text = "\(cart.qty!.intValue)"
        }
        
        cell.isUserInteractionEnabled = false
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension SalesInvoiceViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
