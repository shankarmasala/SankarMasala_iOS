//
//  DeliveryTypeViewController.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 02/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class DeliveryTypeViewController: BaseVC {

    @IBOutlet weak var viewPickup: UIView!
    @IBOutlet weak var viewDelivery: UIView!
    
    
    class func initViewController() -> DeliveryTypeViewController{
        let vc = DeliveryTypeViewController(nibName: "DeliveryTypeViewController", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewPickup.layer.borderColor = UIColor.gray.cgColor
        viewPickup.layer.borderWidth = 2.0
        
        viewDelivery.layer.borderColor = UIColor.gray.cgColor
        viewDelivery.layer.borderWidth = 2.0
        
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonOtionClicked (_ sender : UIButton){
        
        if sender.tag == 1{
            // Pickup clicked
        }else{
            // Delivery Clicked
        }
        
        let controller = SelectBranchViewController.initViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        
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
