//
//  NotificationVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class NotificationVC: BaseVC {
    
    var arrary : [String] = [String]()
    @IBOutlet weak var tblView : UITableView!
    
    class func initViewController() -> NotificationVC {
        let vc = NotificationVC.init(nibName: "NotificationVC", bundle: nil)
        vc.title = "Notification"
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
        tblView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        tblView.rowHeight = UITableView.automaticDimension
        
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
extension NotificationVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NotificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
