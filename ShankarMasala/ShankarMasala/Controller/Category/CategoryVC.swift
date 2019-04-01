//
//  HomeVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 16/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class CategoryVC: BaseVC {
    
    var arrCategory = [Categori]()
    @IBOutlet var collection: UICollectionView!
    
    
    class func initViewController() -> CategoryVC{
        let vc = CategoryVC(nibName: "CategoryVC", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CATEGORY"
        
        initCollectionView()
        
        LoaderView.displaySpinner()
        Manager.loadAllCategory { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            self.arrCategory = Categori.getAll()!
            self.collection.reloadData()
            
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        isBackButton = false
        super.viewWillAppear(animated)
        self.title = "CATEGORY"
       
        
        
    }
    
    
}



extension CategoryVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func initCollectionView() {
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "CategoryFullRowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryFullRowCollectionViewCell")
        
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CategoryFullRowCollectionViewCell", for: indexPath) as? CategoryFullRowCollectionViewCell
        let cat = self.arrCategory[indexPath.row]
        cell?.setData(cate: cat)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cat = self.arrCategory[indexPath.row]
        if cat.image_type == 0 {
            // full
            return CGSize(width: collectionView.frame.width , height: 200)
        }
        return CGSize(width: (collectionView.frame.width / 2) - 5 , height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = self.arrCategory[indexPath.row]
        let vc = ProductVC.initViewController(cat: cat)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
