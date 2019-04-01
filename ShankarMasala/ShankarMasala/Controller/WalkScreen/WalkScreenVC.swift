//
//  WalkScreenVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 14/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class WalkScreenVC: UIViewController {

    var page_number : Int?
    
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var img_bottom : UIImageView!
    
    class func initViewController(page : Int) -> WalkScreenVC{
        let vc = WalkScreenVC(nibName: "WalkScreenVC", bundle: nil)
        vc.page_number = page
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if page_number == 0 {
            img.image = UIImage(named: "SplashMiddle1")
            img_bottom.image = UIImage(named: "SplashBottom1")
            //self.view.backgroundColor = UIColor.red
        }else if page_number == 1{
            img.image = UIImage(named: "SplashMiddle2")
            img_bottom.image = UIImage(named: "SplashBottom2")
            //self.view.backgroundColor = UIColor.green
        }else if page_number == 2{
            img.image = UIImage(named: "SplashMiddle3")
            img_bottom.image = UIImage(named: "SplashBottom3")
            //self.view.backgroundColor = UIColor.blue
        }
        
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
