//
//  SelectBranchViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 02/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class SelectBranchViewController: BaseVC {

    @IBOutlet var tblView : UITableView!
    var sections : [Int] = [Int]()
    class func initViewController() -> SelectBranchViewController{
        let vc = SelectBranchViewController(nibName: "SelectBranchViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "BranchTableViewCell", bundle: nil), forCellReuseIdentifier: "BranchTableViewCell")
        tblView.register(UINib(nibName: "PersonalInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonalInfoTableViewCell")
        
        
        LoaderView.displaySpinner()
        Manager.loadAllStore { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            self.sections = Store.getAllBySectionsCityIds() ?? [0]
            self.tblView.reloadData()
            
        }
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextClicked (sender : UIButton) {
        
        let VC = PlaceOrderViewController.initViewController()
        self.navigationController?.pushViewController(VC, animated: true)
        
    }

}

extension SelectBranchViewController : UITableViewDelegate{
    
}

extension SelectBranchViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sections.count <= 0 {
            return 0
        }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == sections.count - 1 {
            return 1
        }
        let cityid = sections[section]
        let s = Store.getByCityId(c_id: cityid)
        return s?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cityid = sections[section]
        let store = Store.getByCityIdStore(c_id: cityid)
        return store!.city_name
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == sections.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoTableViewCell", for: indexPath) as! PersonalInfoTableViewCell
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchTableViewCell", for: indexPath) as! BranchTableViewCell
        cell.selectionStyle = .none
        let cityid = sections[indexPath.section]
        let s_arr  = Store.getByCityId(c_id: cityid)
        let store  = s_arr![indexPath.row]
        print(store.store_name)
        return cell
    }
    
}
