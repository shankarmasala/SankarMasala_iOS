//
//  OrderHistoryProductListViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 04/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderHistoryProductListViewController: BaseVC {

    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblDeliveryStatus: UILabel!
    @IBOutlet weak var lblPaymentTypr: UILabel!
    @IBOutlet weak var paymentStatus: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var btnTotalAmount: UIStackView!
    
    @IBOutlet weak var btnViewInvoice: UITableView!
    
    var dictOrderInfo : [String:Any] = [String:Any]()
    
    let arrCart : [Cart] = Cart.getAll() ?? []
    
    class func initViewController() -> OrderHistoryProductListViewController{
        let vc = OrderHistoryProductListViewController(nibName: "OrderHistoryProductListViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "OrderHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryTableViewCell")
        
        if let payentMethod = dictOrderInfo["PaymentType"] as? String{
            lblPaymentTypr.text = payentMethod
        }
        
        if let store = dictOrderInfo["store"] as? Store{
            let strAddress = "\(store.store_name!) \n\(store.store_address!)\n\n\(store.contact_number ?? "")"
            lblLocation.text = strAddress
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewInvoiceClicked(_ sender: Any) {
        
        let controller = SalesInvoiceViewController.initViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func totalClicked(_ sender: Any) {
    }
    
}

extension OrderHistoryProductListViewController : UITableViewDelegate{
    
}

extension OrderHistoryProductListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCart.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryTableViewCell", for: indexPath) as! OrderHistoryTableViewCell
        
        let cart = arrCart[indexPath.row]
        
        cell.lblProductName.text = cart.product?.product_name ?? ""
        
        if let image = cart.product?.image1{
            let imagename = image.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = kBaseUrl + kProductImageLoad + imagename
            cell.imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        }
        cell.lblPrice.text = "Selling Price : \(cart.productAttribute!.selling_price!.intValue)"
        cell.lblMRP.text = "MRP : \(cart.productAttribute!.mrp!.intValue)"
        cell.lblQty.text = "Qty : \(cart.qty!.intValue)"
        cell.lblPacking.text = "Packing : \(cart.productAttribute!.weight!) \(cart.productAttribute!.unit!)"
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}
