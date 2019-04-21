//
//  OrderHistoryProductListViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 04/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderProductVC: BaseVC {
    
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblDeliveryStatus: UILabel!
    @IBOutlet weak var lblPaymentTypr: UILabel!
    @IBOutlet weak var paymentStatus: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var btnTotalAmount: UIButton!
    
    @IBOutlet weak var btnViewInvoice: UIButton!
    
    var dictOrderInfo : [String:Any] = [String:Any]()
    var dict_item : [[String:Any]] = [[String:Any]]()
    
    class func initViewController() -> OrderProductVC{
        let vc = OrderProductVC(nibName: "OrderProductVC", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "OrderHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryTableViewCell")
        
        dict_item = dictOrderInfo["item"] as! [[String : Any]]
        tblView.reloadData()
        
        lblOrderId.text = dictOrderInfo["invoiceId"] as? String
        let dd = dictOrderInfo["createdDate"] as? String
        lblOrderDate.text = DateUtils.getStringFormat(str:dd!)
        lblDeliveryStatus.text = dictOrderInfo["-"] as? String
        let status = dictOrderInfo["status"] as? Int
        paymentStatus.text = Utils.getOrderStatus(statusCode: status!)
        
        //btnTotalAmount.text = dictOrderInfo[""] as? String
        //btnViewInvoice
        
        if let payentMethod = dictOrderInfo["PaymentType"] as? String{
            lblPaymentTypr.text = payentMethod
        }
        
        
        if let store = dictOrderInfo["store"] as? Store{
            let strAddress = "\(store.store_name!) \n\(store.store_address!)\n\n\(store.contact_number ?? "")"
            lblLocation.text = strAddress
        }
        if let store_data = dictOrderInfo["store_data"] as? [String:Any]{
            let store_name = store_data["store_name"] as? String
            let store_address = store_data["store_address"] as? String
            let contact_number = store_data["contact_number"] as? String
            let strAddress = "\(store_name ?? "") \n\(store_address ?? "")\n\n\(contact_number ?? "")"
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

extension OrderProductVC : UITableViewDelegate{

}

extension OrderProductVC : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict_item.count;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryTableViewCell", for: indexPath) as! OrderHistoryTableViewCell

        let item = dict_item[indexPath.row]

        cell.lblProductName.text = (item["productName"] as! String)

        if let image = item["img"] as? String{
            let imagename = image.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = kBaseUrl + kProductImageLoad + imagename
            cell.imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        }
        let product_selling_price = item["product_selling_price"] as? Int
        cell.lblPrice.text = "Offer Price : Rs.\(product_selling_price ?? 0)"
        
        let product_mrp = item["product_mrp"] as? Int
        cell.lblMRP.text = "MRP : \(product_mrp ?? 0)"
        
        let qty = item["qty"] as? String
        cell.lblQty.text = "Qty : \(qty ?? "")"
        
        let size = item["size"] as? String
        let unit = item["unit"] as? String
        cell.lblPacking.text = "Packing : \(size ?? "") \(unit ?? "")"

        cell.selectionStyle = .none

        return cell
    }

}
