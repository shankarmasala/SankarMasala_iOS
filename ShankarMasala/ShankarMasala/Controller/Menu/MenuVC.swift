//
//  MenuVC.swift
//  Transport
//
//  Created by Samir on 06/02/19.
//  Copyright © 2019 Samir Khatri. All rights reserved.
//

import UIKit

protocol MenuVCDelegate:class {
    func menuItemClicked(indexpath : IndexPath)
}

class MenuVC: UIViewController {
    
    //MARK:- IB Outlets
    @IBOutlet weak var tblMenuList: UITableView!
    
    var block : MenuVCDelegate?
    
    //MARK:- Properties
    var selectedIndexpath = IndexPath()
    
    let menuNameArray = ["Home", "About Us", "Order History", "Shipping Charges", "Contact Us", "Share This App", "Logout"]
    
    
    //MARK:- Initializers

    class func initViewController() -> MenuVC {
        let vc = MenuVC.init(nibName: "MenuVC", bundle: nil)
        return vc
    }
    
    //MARK:- View Delegates

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name(rawValue: kSideMenuUIUpdate), object: nil)
        
        //setup UIView
        self.setupView()
    }
    
    
   @objc func updateUI() {
        self.tblMenuList.reloadData()
    }
    
    //MARK: - [Private] Methods
    
    func setupView() {
        tblMenuList.tableFooterView = UIView()
        tblMenuList.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: "MenuViewCell")
        tblMenuList.rowHeight = UITableView.automaticDimension
        //NotificationCenter.default.addObserver(self, selector: #selector(reload), name: .menuTblReload, object: nil)
    }
    
    @objc func reload(){
        self.tblMenuList.reloadData()
    }
}

//MARK:
//MARK:- Tableview Delegates
extension MenuVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  {
            return 1
        }
       return self.menuNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MenuViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCell", for: indexPath) as! MenuViewCell
        
        cell.selectionStyle = .none
        
        cell.vwHeader.isHidden = true
        cell.vwCell.isHidden = true
        
        if indexPath.section == 0 {
            cell.vwHeader.isHidden = false
            cell.lblMobile_number.text = "9173344873"

        }else{
            cell.vwCell.isHidden = false
            cell.lblMenuTitle.text = menuNameArray[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 135
        }
        else {
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.shared().slideMenuController?.closeLeft()
        selectedIndexpath = indexPath
        block?.menuItemClicked(indexpath: indexPath)
    }

    
    func showProfile() {
       // appDelegateShared?.drawerController.setDrawerState(.closed, animated: true)
        //block?.profileClicked()
        
    }
}
