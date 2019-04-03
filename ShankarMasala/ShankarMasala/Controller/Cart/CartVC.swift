//
//  CartVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 16/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class CartVC: BaseVC {

    var arrary : [Cart] = [Cart]()
    
    @IBOutlet weak var tblView : UITableView!
    @IBOutlet weak var btnTotal : UIButton!
    
    class func initViewController() -> CartVC{
        let vc = CartVC(nibName: "CartVC", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = false
        super.viewDidLoad()
        self.title = "CART"

    
        
        arrary = Cart.getAll()!
        self.updateCart()
        tblView.tableFooterView = UIView()
        tblView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        
         NotificationCenter.default.addObserver(self, selector: #selector(updateCart), name: NSNotification.Name("update_cart_count"), object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func updateCart() {
        arrary = Cart.getAll()!
        tblView.reloadData()
        let str = "Rs.\(Cart.getTotal())"
        btnTotal.setTitle(str, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.isBackButton = false
        super.viewWillAppear(animated)
        self.title = "CART"
    }
    
}

extension CartVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CartCell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        let c = arrary[indexPath.row]
        
        cell.setCellData(c: c)
        
        cell.btnPlus.tag = indexPath.row
        cell.btnMinus.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.btnDropDown.tag = indexPath.row
        
        cell.btnPlus.addTarget(self, action: #selector(plusClicked(btn:)), for: .touchUpInside)
        cell.btnMinus.addTarget(self, action: #selector(minusClicked(btn:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(deleteClicked(btn:)), for: .touchUpInside)
        cell.btnDropDown.addTarget(self, action: #selector(dropDownClicked(btn:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 133.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func dropDownClicked(btn : UIButton) {
        var weightString : [String] = [String]()
        let c = arrary[btn.tag]
        let arr : [ProductAttribute] = c.product?.product_attribute.allObjects as! [ProductAttribute]
        for att in  arr{
            weightString.append("\(att.weight ?? "none") \(att.unit ?? "none")")
        }
        
        ActionSheetStringPicker.show(withTitle: "", rows: weightString, initialSelection: 0, doneBlock: { (actionsheet_picker, index, result) in
            if result != nil{
                let str : String = result as! String
                let pa = c.findByWeightUnitItem(weight_unit: str)
                c.productAttribute = pa
                c.save()
            }
            
        }, cancel: { (actionsheet_picker) in
            
        }, origin: btn)
    }
    @objc func plusClicked(btn : UIButton) {
        let c = arrary[btn.tag]
        Cart.addItem(pro:  c.product!, att: c.productAttribute!)
    }
    @objc func minusClicked(btn : UIButton) {
        let c = arrary[btn.tag]
        Cart.removeItem(pro: c.product!, att: c.productAttribute!)
    }
    @objc func deleteClicked(btn : UIButton) {
        let c = arrary[btn.tag]
        c.delete()
        
    }
    
    @IBAction func addMoreClicked(){
        //let nav: UINavigationController = (self.navigationController as? UINavigationController)!
        //nav.popToRootViewController(animated: false)
        self.tabBarController?.selectedIndex = 0
    }
    @IBAction func nextClicked(){
        let vc = DeliveryTypeViewController.initViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
}
