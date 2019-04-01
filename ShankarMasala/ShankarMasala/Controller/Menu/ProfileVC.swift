//
//  ProfileVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation
import LMGeocoder

class ProfileVC: BaseVC, CLLocationManagerDelegate {
    
    @IBOutlet weak var lblFirstName: UITextField!
    @IBOutlet weak var lblLastName: UITextField!
    @IBOutlet weak var lblMobileNumber: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblAddress: UITextField!
    let locationManager = CLLocationManager()
    
    class func initViewController() -> ProfileVC {
        let vc = ProfileVC.init(nibName: "ProfileVC", bundle: nil)
        vc.title = "Profile"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        
//        let acc = AccountManager.instance().activeAccount!
//        lblFirstName.text = acc.first_name
//        lblLastName.text = acc.last_name
//        lblEmail.text = acc.email
//        lblAddress.text = acc.address
//        lblMobileNumber.text = acc.mobile_number
        
        // You can set your google API key here
        LMGeocoder.sharedInstance().googleAPIKey = "AIzaSyDm661ykrQCv2M2DJ16MxAbgSH9LF-18_g"
        
        // Start getting current location
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.distanceFilter = 10
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: LOCATION MANAGER DELEGATE
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            
            // Update UI
           // self.latitudeLabel.text = String(format: "%f", coordinate.latitude)
            //self.longitudeLabel.text = String(format: "%f", coordinate.longitude)
            
            // Start to reverse geocode
            LMGeocoder.sharedInstance().cancelGeocode()
            LMGeocoder.sharedInstance().reverseGeocodeCoordinate(coordinate, service: .appleService) { (results: Array<LMAddress>?, error: Error?) in
                
                                                                        // Parse formatted address
                                                                        var formattedAddress: String? = "-"
                                                                        if let address = results?.first, error == nil {
                                                                            formattedAddress = address.formattedAddress
                                                                        }
                
                                                                        // Update UI
                                                                        DispatchQueue.main.async {
                                                                            self.lblAddress.text = formattedAddress
                                                                        }
                            }
        }
    }
    
}

//MARK : UIAction

extension ProfileVC{
    
    @IBAction func updateClicked(){
        var message = ""
        if lblFirstName.text!.count <= 0 {
            message = "Please enter firstname."
        }else if lblLastName.text!.count <= 0 {
            message = "Please enter lastname."
        }else if lblMobileNumber.text!.count <= 0 {
            message = "Please enter mobile number."
        }else if lblMobileNumber.text!.count != 10 {
            message = "Please enter 10 digit mobile number."
        }else if lblEmail.text!.count <= 0 {
            message = "Please enter email."
        }else if !Utils.isEmail(txt: lblEmail.text!) {
            message = "Please enter valid email."
        }
        
        if message.count > 0 {
            Utils.showAlert(withMessage: message)
            return
        }
        LoaderView.displaySpinner()
        let acc = AccountManager.instance().activeAccount!
        acc.first_name = lblFirstName.text!
        acc.last_name = lblLastName.text!
        acc.mobile_number = lblMobileNumber.text!
        acc.email = lblEmail.text!
        acc.address = lblAddress.text!
        
        acc.editUser { (isSuccess, account, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            Utils.showAlert(withMessage: "User updated successfully.")
            AccountManager.instance().activeAccount = account
        }
        
    }
    
}
