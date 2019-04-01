//
//  NotificationVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderHistoryVC: BaseVC {
    
    var arrary : [String] = [String]()
    @IBOutlet weak var tblView : UITableView!
    
    class func initViewController() -> OrderHistoryVC {
        let vc = OrderHistoryVC.init(nibName: "OrderHistoryVC", bundle: nil)
        vc.title = "Order History"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        arrary.append("A")
        
        tblView.tableFooterView = UIView()
        tblView.register(UINib(nibName: "OrderHistoryCell", bundle: nil), forCellReuseIdentifier: "OrderHistoryCell")
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
        cell.lblStatus.text = "Pending"
        cell.lblOrderId.text = "1234"
        cell.lblOrderdate.text = "12-12-1989"
        cell.lblTotalPaid.text = "$12,000"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
        let vc = OrderProductVC.initViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
