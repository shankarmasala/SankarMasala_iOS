//
//  ShippingDetailVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 23/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ShippingDetailVC: BaseVC {
    
    var arrary : [ShippingMethods] = [ShippingMethods]()
    @IBOutlet weak var tblView : UITableView!
    var state : State?
    
    class func initViewController(state : State) -> ShippingDetailVC {
        let vc = ShippingDetailVC.init(nibName: "ShippingDetailVC", bundle: nil)
        vc.title = state.state_name
        vc.state = state
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        self.tblView.layer.borderWidth = 1
        tblView.layer.borderColor = UIColor(red: 94.0/255.0, green: 94.0/255.0, blue: 94.0/255.0, alpha: 1.0).cgColor
        self.tblView.tableFooterView = UIView()
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 44
        
        
        tblView.register(UINib(nibName: "ShippingDetailFirstCell", bundle: nil), forCellReuseIdentifier: "ShippingDetailFirstCell")
        
        tblView.register(UINib(nibName: "ShippingDetailSecondsCell", bundle: nil), forCellReuseIdentifier: "ShippingDetailSecondsCell")
        LoaderView.displaySpinner()
        Manager.loadCitiesByCountryId(countryid: state?.state_id ?? "0") { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
           let shipping = ShippingMethods.getAll()
            self.arrary = shipping!
            self.tblView.reloadData()
        
            
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
}
//MARK:- Tableview Delegates
extension ShippingDetailVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell : ShippingDetailFirstCell = tableView.dequeueReusableCell(withIdentifier: "ShippingDetailFirstCell", for: indexPath) as! ShippingDetailFirstCell
            cell.selectionStyle = .none
            return cell
        }
        let cell : ShippingDetailSecondsCell = tableView.dequeueReusableCell(withIdentifier: "ShippingDetailSecondsCell", for: indexPath) as! ShippingDetailSecondsCell
        let shh = arrary[indexPath.row - 1]
        cell.setData(shpp: shh)
        cell.selectionStyle = .none
        if indexPath.row % 2 == 0 {
            cell.viewCost.backgroundColor = UIColor.white
            cell.viewWeight.backgroundColor = UIColor.white
            cell.viewCityname.backgroundColor = UIColor.white
        }else{
            cell.viewCost.backgroundColor = UIColor(red: 242/255, green: 240/255, blue: 241/255, alpha: 1.0)
            cell.viewWeight.backgroundColor = UIColor(red: 242/255, green: 240/255, blue: 241/255, alpha: 1.0)
            cell.viewCityname.backgroundColor = UIColor(red: 242/255, green: 240/255, blue: 241/255, alpha: 1.0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
