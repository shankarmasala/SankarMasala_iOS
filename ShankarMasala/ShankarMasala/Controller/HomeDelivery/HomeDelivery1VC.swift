//
//  HomeDelivery1VC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 04/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class HomeDelivery1VC: BaseVC {

    
    @IBOutlet weak var txtFirstname: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtMobilename: UITextField!
    @IBOutlet weak var txtEmailname: UITextField!
    @IBOutlet weak var txtHouseNo: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPin: UITextField!
    @IBOutlet weak var txtLandMark: UITextField!
    @IBOutlet weak var txtGST: UITextField!
    
    
    
    class func initViewController() -> HomeDelivery1VC{
        let vc = HomeDelivery1VC(nibName: "HomeDelivery1VC", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func countryClicked(sender : UIButton) {
        
    }
    @IBAction func stateClicked(sender : UIButton) {
        
    }
    @IBAction func cityClicked(sender : UIButton) {
        
    }
    @IBAction func nextClicked(sender : UIButton) {
        
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
