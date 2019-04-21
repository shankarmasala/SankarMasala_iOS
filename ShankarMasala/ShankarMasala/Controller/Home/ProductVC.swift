//
//  ProductVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 21/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ProductVC: BaseVC {

    var arrProduct = [Product]()
    var category : Categori?
    @IBOutlet var collection: UICollectionView!
    
    class func initViewController(cat : Categori) -> ProductVC{
        let vc = ProductVC(nibName: "ProductVC", bundle: nil)
        vc.category = cat
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        self.title = category?.category_name
        
        initCollectionView()
        
        
        LoaderView.displaySpinner()
        Manager.loadAllProductByCategory(cat: category!) { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            self.arrProduct = Product.getAllByCategory(cat: self.category!)!
            self.collection.reloadData()
            
        }
        
        
//        self.arrProduct = Product.getAllByCategory(cat: self.category!)!
//        self.collection.reloadData()
        
        //LoaderView.displaySpinner()
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        isBackButton = true
        super.viewWillAppear(animated)
        
        
    }

}

extension ProductVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func initCollectionView() {
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell
        let pro = self.arrProduct[indexPath.row]
        cell?.setData(pro: pro)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width / 2) - 5 , height: (collectionView.frame.width / 2) - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let pro = self.arrProduct[indexPath.row]
        let vc = ProductDetailVC.initViewController(pro: pro, cat: category!)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
