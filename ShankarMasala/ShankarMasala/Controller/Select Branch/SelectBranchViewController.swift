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
    
    var selectedBranchId : Int = 0
    
    var strFirstName : String = ""
    var strLastName : String = ""
    var strPhoneNumber : String = ""
    var strEmailId : String = ""
    var selectedStore : Store!
    
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
        
        guard strEmailId.count > 0,strPhoneNumber.count != 0, strLastName.count > 0, strFirstName.count > 0,selectedBranchId > 0 else {
            
            if strEmailId.count == 0{
                Utils.showAlert(withTitle: "Shankar Masala", withMessage: "Please enter Email Id", withButtonTitle: "Ok")
            }else if strPhoneNumber.count != 10{
                Utils.showAlert(withTitle: "Shankar Masala", withMessage: "Please enter Phone number", withButtonTitle: "Ok")
            }else if strFirstName.count == 0{
                Utils.showAlert(withTitle: "Shankar Masala", withMessage: "Please enter First name", withButtonTitle: "Ok")
            }else if strLastName.count == 0{
                Utils.showAlert(withTitle: "Shankar Masala", withMessage: "Please enter Last name", withButtonTitle: "Ok")
            }else if selectedBranchId > 0{
                Utils.showAlert(withTitle: "Shankar Masala", withMessage: "Please select branch", withButtonTitle: "Ok")
            }
            
            return
        }
        
        let dictOrderInfo : [String:Any] = ["FirstName":strFirstName,"LastName":strLastName,"EmailId":strEmailId,"PhoneNumber":strPhoneNumber,"store":selectedStore]
        
        let VC = PlaceOrderViewController.initViewController()
        VC.dictOrderInfo = dictOrderInfo
        self.navigationController?.pushViewController(VC, animated: true)
        
    }

    @objc func textFieldDidChangeValue (textField : UITextField){
        
        if textField.tag == 1{
            strFirstName = textField.text!
        }else if textField.tag == 2 {
            strLastName = textField.text!
        }else if textField.tag == 3{
            strPhoneNumber = textField.text!
        }else if textField.tag == 4 {
            strEmailId = textField.text!
        }
        
    }
    
}

extension SelectBranchViewController : UITableViewDelegate{
    
}

extension SelectBranchViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sections.count <= 0 {
            return 0
        }
        return sections.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == sections.count {
            return 1
        }
        let cityid = sections[section]
        let s = Store.getByCityId(c_id: cityid)
        return s?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == sections.count{
            return ""
        }
        
        let cityid = sections[section]
        let store = Store.getByCityIdStore(c_id: cityid)
        return store!.city_name
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == sections.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoTableViewCell", for: indexPath) as! PersonalInfoTableViewCell
            
            cell.txtFirstName.delegate = self
            cell.txtLastName.delegate = self
            cell.txtPhoneNumber.delegate = self
            cell.txtEmail.delegate = self
            
            cell.txtFirstName.addTarget(self, action: #selector(textFieldDidChangeValue(textField:)), for: .editingChanged)
            cell.txtLastName.addTarget(self, action: #selector(textFieldDidChangeValue(textField:)), for: .editingChanged)
            cell.txtEmail.addTarget(self, action: #selector(textFieldDidChangeValue(textField:)), for: .editingChanged)
            cell.txtPhoneNumber.addTarget(self, action: #selector(textFieldDidChangeValue(textField:)), for: .editingChanged)
            
            cell.txtFirstName.text = strFirstName
            cell.txtLastName.text = strLastName
            cell.txtPhoneNumber.text = strPhoneNumber
            cell.txtEmail.text = strEmailId
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchTableViewCell", for: indexPath) as! BranchTableViewCell
        cell.selectionStyle = .none
        let cityid = sections[indexPath.section]
        let s_arr  = Store.getByCityId(c_id: cityid)
        let store  = s_arr![indexPath.row]
        
        if let name = store.store_name{
            cell.lblTitle.text = name
        }else{
            cell.lblTitle.text = " "
        }

        if let address = store.store_address{
            cell.lblAddress.text = address
        }else{
            cell.lblAddress.text = ""
        }
        
        if let number = store.contact_number{
            cell.lblContactNumber.text = "Contact Number : \(number)"
        }else{
            cell.lblContactNumber.text = "Contact Number :"
        }
        cell.selectionStyle = .none
        
        if let storeId = store.entityid, storeId.intValue == selectedBranchId{
            cell.imgSelection.image = UIImage(named: "selected-radio")
        }else{
            cell.imgSelection.image = UIImage(named: "unselected-radio")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == sections.count {
            return
        }
        
        let cityid = sections[indexPath.section]
        let s_arr  = Store.getByCityId(c_id: cityid)
        let store  = s_arr![indexPath.row]
        selectedStore = store
        if let storeId = store.entityid{
            selectedBranchId = storeId.intValue
        }
        
        tableView.reloadData()
    }
    
}

extension SelectBranchViewController : UITextFieldDelegate{
    
}

