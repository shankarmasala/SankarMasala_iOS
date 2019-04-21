//
//  AboutUsVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class AboutUsVC: BaseVC {

    
    class func initViewController() -> AboutUsVC {
        let vc = AboutUsVC.init(nibName: "AboutUsVC", bundle: nil)
        vc.title = "About Us"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()

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


