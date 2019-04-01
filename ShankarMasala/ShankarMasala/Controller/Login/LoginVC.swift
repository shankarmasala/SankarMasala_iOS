//
//  LoginVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 15/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit
import CountryPickerView
import Presentr
class LoginVC: UIViewController {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var txtMobile: UITextField!
    var phoneCode : String?
    
    let countryPickerView = CountryPickerView()

    class func initViewController() -> LoginVC{
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        return vc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewCountryView()

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
//MARK : Country select
extension LoginVC: CountryPickerViewDelegate, CountryPickerViewDataSource{
    
    func initViewCountryView() {
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        /*** Direct customizations on CountryPickerView instance ***/
        
        // Show the selected country's phone(e.g +234) code on the view
        countryPickerView.showPhoneCodeInView = true
        
        
        // Show the selected country's iso code(e.g NG) on the view
        countryPickerView.showCountryCodeInView = true
        
       let country =  countryPickerView.getCountryByCode("IN")
        imgIcon.image =  country?.flag
        lblCode.text =  (country?.code)! + " " + (country?.phoneCode)!
        phoneCode = country?.phoneCode
        
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        imgIcon.image =  country.flag
        lblCode.text =  (country.code) + " " + (country.phoneCode)
       // print(country)
    }
}

//MARK : Button Action

extension LoginVC{
    @IBAction func sendOTPClicked() {
        
       // let vc = OtpVC.initViewController()
      //  self.navigationController?.pushViewController(vc, animated: true)
        
        
        let  mobileno = txtMobile.text?.trimmingCharacters(in: .whitespaces)
        if (mobileno?.isPhoneNumber)! {
            let acc : Account = Account()
            acc.mobile_number = mobileno!
            acc.verification_key = ""
            acc.country_code = phoneCode!
            LoaderView.displaySpinner()
            acc.register{ (isSuccess, account, message) -> (Void) in
                LoaderView.removeSpinner()
                if message.count > 0 {
                     Utils.showAlert(withMessage: message)
                     return
                }
                AccountManager.instance().activeAccount = account
                let vc = OtpVC.initViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }else{
            Utils.showAlert(withMessage: "Please enter valid Mobile number.")
        }
    }
    @IBAction func selectCountryClicked() {
        countryPickerView.showCountriesList(from: self)
        //countryPickerView.showCountriesList(from: self)
    }
}
