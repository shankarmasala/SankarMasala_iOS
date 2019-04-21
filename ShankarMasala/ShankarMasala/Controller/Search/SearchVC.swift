//
//  SearchVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 16/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class SearchVC: BaseVC, UITextFieldDelegate {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var txtField: UITextField!
    var arrary : [Product] = [Product]()
    @IBOutlet weak var tblView : UITableView!
    
    class func initViewController() -> SearchVC{
        let vc = SearchVC(nibName: "SearchVC", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = false
        super.viewDidLoad()
        self.title = "SEARCH"
        
        self.subView.layer.borderColor = UIColor(red: 253.0/255.0, green: 254.0/255.0, blue: 138.0/255.0, alpha: 1.0).cgColor
        self.subView.layer.borderWidth = 1
        self.subView.clipsToBounds = true
        

        tblView.tableFooterView = UIView()
        tblView.register(UINib(nibName: "OfferCell", bundle: nil), forCellReuseIdentifier: "OfferCell")
        
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableView.automaticDimension
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.isBackButton = false
        super.viewWillAppear(animated)
        self.title = "SEARCH"
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            self.apiCalling(searchString: updatedText)
            
            
        }
        return true
    }

    func apiCalling(searchString : String) {
       // LoaderView.displaySpinner()
        Manager.loadProductByProductName(productname: searchString) { (result, message) -> (Void) in
           // LoaderView.removeSpinner()
            self.arrary = Product.searchByName(str: searchString)!
            self.tblView.reloadData()
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
//MARK:- Tableview Delegates
extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : OfferCell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as! OfferCell
        let pro = self.arrary[indexPath.row]
        cell.setData(pro: pro)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
        let pro = self.arrary[indexPath.row]
        let vc = ProductDetailVC.initViewController(pro: pro)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
