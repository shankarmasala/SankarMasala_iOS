//
//  NotificationVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderHistoryVC: BaseVC {
    
    var arrary : [[String : Any]] = [[String : Any]]()
    @IBOutlet weak var tblView : UITableView!
    
    class func initViewController() -> OrderHistoryVC {
        let vc = OrderHistoryVC.init(nibName: "OrderHistoryVC", bundle: nil)
        vc.title = "Order History"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        
        tblView.tableFooterView = UIView()
        tblView.register(UINib(nibName: "OrderHistoryCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryCell")
        
        LoaderView.displaySpinner()
        Manager.loadAllOrders { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            self.arrary = result as! [[String : Any]]
            self.tblView.reloadData()
            
        }
        
       
        //tblView.rowHeight = UITableView.automaticDimension
        
        // Do any additional setup after loading the view.
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
//MARK:- Tableview Delegates
extension OrderHistoryVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : OrderHistoryCell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCell", for: indexPath) as! OrderHistoryCell
        let order : [String : Any] = arrary[indexPath.row]
        
        if let order_status : Int =  order["invoiceId"] as? Int{
            cell.lblStatus.text = Utils.getOrderStatus(statusCode: order_status)
        }
        
        if let invoice_number : Int =  order["invoiceId"] as? Int{
            cell.lblOrderId.text = String(invoice_number)
        }
        
       
        cell.lblOrderdate.text = DateUtils.getStringFormat(str: order["createdDate"] as! String)
            //"12-12-1989"
        cell.lblTotalPaid.text = "Rs.\(String(describing: order["total_price"]!))"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
        let order = arrary[indexPath.row]
        LoaderView.displaySpinner()
        let invoice_number : Int =  (order["invoiceId"] as? Int)!
        Manager.loadOrderByInvoiceId(invoceid:String(invoice_number)) { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            let vc = OrderProductVC.initViewController()
            vc.dictOrderInfo = result as! [String : Any]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
}
