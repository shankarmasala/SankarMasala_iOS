//
//  ContactUsVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 22/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ContactUsVC: BaseVC {

    class func initViewController() -> ContactUsVC {
        let vc = ContactUsVC.init(nibName: "ContactUsVC", bundle: nil)
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
