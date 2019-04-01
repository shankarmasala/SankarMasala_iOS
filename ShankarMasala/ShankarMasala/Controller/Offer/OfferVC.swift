//
//  NotificationVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OfferVC: BaseVC {
    
    var arrary : [String] = [String]()
    @IBOutlet weak var tblView : UITableView!
    
    class func initViewController() -> OfferVC {
        let vc = OfferVC.init(nibName: "OfferVC", bundle: nil)
        vc.title = "OFFER"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = false
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
        tblView.register(UINib(nibName: "OfferCell", bundle: nil), forCellReuseIdentifier: "OfferCell")
        
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableView.automaticDimension
        //tblView.rowHeight = UITableView.automaticDimension
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.isBackButton = false
        super.viewWillAppear(animated)
        //AppDelegate.shared().leftViewController?.block = self
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
extension OfferVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : OfferCell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as! OfferCell
       // cell.lblStatus.text = "Pending"
        //cell.lblOrderId.text = "1234"
        //cell.lblOrderdate.text = "12-12-1989"
        //cell.lblTotalPaid.text = "$12,000"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
       // let vc = OrderProductVC.initViewController()
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
