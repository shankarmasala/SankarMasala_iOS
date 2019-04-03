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
        
        // Do any additional setup after loading the view.
    }

}

extension SelectBranchViewController : UITableViewDelegate{
    
}

extension SelectBranchViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BranchTableViewCell", for: indexPath) as! BranchTableViewCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoTableViewCell", for: indexPath) as! PersonalInfoTableViewCell
            
            return cell
        }
        
    }
    
}
