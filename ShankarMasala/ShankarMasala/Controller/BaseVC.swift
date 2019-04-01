//
//  BaseVC.swift
//  Transport
//
//  Created by Samir Khatri on 08/02/19.
//  Copyright © 2019 Samir Khatri. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    var isBackButton : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isBackButton == true {
            
        }else{
            
            
            AppDelegate.shared().leftViewController?.block = self
            
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
        
        if isBackButton == true {
            let btn1 = UIButton(type: .custom)
            btn1.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            btn1.setImage(UIImage(named: "image_back"), for: .normal)
            btn1.addTarget(self, action: #selector(self.backClicked), for: .touchUpInside)
            let item1 = UIBarButtonItem(customView: btn1)
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationItem.setLeftBarButtonItems([item1], animated: true)
        }else{
            
            
            AppDelegate.shared().leftViewController?.block = self
            let btn1 = UIButton(type: .custom)
            btn1.setImage(UIImage(named: "Menu"), for: .normal)
            btn1.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            btn1.addTarget(self, action: #selector(self.menuClicked), for: .touchUpInside)
            let item1 = UIBarButtonItem(customView: btn1)
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationItem.setLeftBarButtonItems([item1], animated: true)
        }
    }
    
    
    @objc func backClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func menuClicked(){
        AppDelegate.shared().slideMenuController?.openLeft()
    }
    
}
extension BaseVC :MenuVCDelegate {
    func menuItemClicked(indexpath: IndexPath) {
        if indexpath.section == 0{
            let vc = ProfileVC.initViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            if indexpath.row == 0 {
                //Home
            }else if indexpath.row == 1 {
                let vc = AboutUsVC.initViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexpath.row == 2 {
                let vc = OrderHistoryVC.initViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexpath.row == 3 {
                let vc = ShppingChargesVC.initViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexpath.row == 4 {
                let vc = ContactUsVC.initViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else if indexpath.row == 5 {
                // text to share
                let text = "http://www.google.com"
                
                // set up activity view controller
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop]
                
                // present the view controller
                self.present(activityViewController, animated: true, completion: nil)
            }else if indexpath.row == 6 {
                let alertController = UIAlertController(title: ALERT_TITLE, message: LogoutAlert, preferredStyle: .alert)
                
                // Create the actions
                let okAction = UIAlertAction(title: tYes, style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    AppDelegate.shared().logout()
                }
                let cancelAction = UIAlertAction(title: tNo, style: UIAlertAction.Style.cancel) {
                    UIAlertAction in
                }
                
                // Add the actions
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                // Present the controller
                self.present(alertController, animated: true, completion: nil)
                
                
            }
        }
    }
}
