//
//  CancelOrderVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 02/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class CancelOrderVC: BaseVC {
    
    class func initViewController() -> CancelOrderVC {
        let vc = CancelOrderVC.init(nibName: "CancelOrderVC", bundle: nil)
        vc.title = "Cancel Order"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func call(){
        UIApplication.shared.openURL(NSURL(string: "tel://+917802954954")! as URL)
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
