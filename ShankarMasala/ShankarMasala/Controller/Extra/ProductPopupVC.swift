//
//  ProductPopupVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 25/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit
import SDWebImage
class ProductPopupVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    var arr : [String] = [String]()
    
    class func initViewController(imgArr : [String]) -> ProductPopupVC{
        let vc = ProductPopupVC(nibName: "ProductPopupVC", bundle: nil)
        vc.arr = imgArr
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeBack.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeBack)
        
        let swipeNext = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeNext.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeNext)
        
        if arr.count > 0 {
            let img_name = arr[0]
            let imagename = img_name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = kBaseUrl + kProductImageLoad + imagename
            imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        }
        
        // Do any additional setup after loading the view.
    }
   @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped back")
                pageControl.currentPage = 0
                let img_name = arr[0]
                let imagename = img_name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                let url = kBaseUrl + kProductImageLoad + imagename
                imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
                pageControl.currentPage = 1
                let img_name = arr[1]
                let imagename = img_name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                let url = kBaseUrl + kProductImageLoad + imagename
                imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
            default:
                break
            }
        }
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
