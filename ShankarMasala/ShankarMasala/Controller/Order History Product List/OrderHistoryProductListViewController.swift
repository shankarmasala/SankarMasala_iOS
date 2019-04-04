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
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var btnTotalAmount: UIStackView!
    
    @IBOutlet weak var btnViewInvoice: UITableView!
    
    class func initViewController() -> OrderHistoryProductListViewController{
        let vc = OrderHistoryProductListViewController(nibName: "OrderHistoryProductListViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "OrderHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewInvoiceClicked(_ sender: Any) {
    }
    
    @IBAction func totalClicked(_ sender: Any) {
    }
    
}

extension OrderHistoryProductListViewController : UITableViewDelegate{
    
}

extension OrderHistoryProductListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryTableViewCell", for: indexPath) as! OrderHistoryTableViewCell
        
        return cell
    }
    
}
