//
//  AboutUsVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 17/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class AboutUsVC: BaseVC {

    @IBOutlet weak var webView : UIWebView!
    
    class func initViewController() -> AboutUsVC {
        let vc = AboutUsVC.init(nibName: "AboutUsVC", bundle: nil)
        vc.title = "About Us"
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        let url = URL(string: "https://www.google.co.in")
        let requestObj = URLRequest(url: url! as URL)
        webView.loadRequest(requestObj)
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

extension AboutUsVC : UIWebViewDelegate{
    func webViewDidStartLoad(_ webView: UIWebView) {
        LoaderView.displaySpinner()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        LoaderView.removeSpinner()
    }
}
