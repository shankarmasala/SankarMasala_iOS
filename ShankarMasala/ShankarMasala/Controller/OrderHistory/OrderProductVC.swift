//
//  OrderProductVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 21/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class OrderProductVC: BaseVC {
    
    var arrary : [String] = [String]()
    @IBOutlet weak var tblView : UITableView!
    
    class func initViewController() -> OrderProductVC {
        let vc = OrderProductVC.init(nibName: "OrderProductVC", bundle: nil)
        vc.title = "Order..."
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
        tblView.register(UINib(nibName: "OrderProductCell", bundle: nil), forCellReuseIdentifier: "OrderProductCell")
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
extension OrderProductVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : OrderProductCell = tableView.dequeueReusableCell(withIdentifier: "OrderProductCell", for: indexPath) as! OrderProductCell
        cell.setCellData()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 133.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
    }
}

