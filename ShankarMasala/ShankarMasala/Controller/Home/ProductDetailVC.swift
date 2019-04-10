

import UIKit
import SDWebImage
class ProductDetailVC: BaseVC {
    
    var product : Product?
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var imgViewBorder : UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblStockStatus: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblGujratiTitle: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblSave: UILabel!
    var selectedQty : Int = 0
    var attribute : ProductAttribute?
    var category : Categori?
    
    let yourViewBorder = CAShapeLayer()
    
    class func initViewController(pro : Product,cat : Categori) -> ProductDetailVC{
        let vc = ProductDetailVC(nibName: "ProductDetailVC", bundle: nil)
        vc.product = pro
        vc.category = cat
        return vc
    }
    
    
    class func initViewController(pro : Product) -> ProductDetailVC{
        let vc = ProductDetailVC(nibName: "ProductDetailVC", bundle: nil)
        vc.product = pro
       // vc.category = cat
        return vc
    }
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        //255 187 104
        imgViewBorder.layer.borderColor = UIColor(red: 255.0/255.0, green: 187.0/255.0, blue: 104.0/255.0, alpha: 1.0).cgColor
        imgViewBorder.layer.borderWidth = 1.0
        
        tblView.tableFooterView = UIView()
        tblView.register(UINib(nibName: "ProductItemCell", bundle: nil), forCellReuseIdentifier: "ProductItemCell")
        
        tblView.register(UINib(nibName: "ProductItemTitleCell", bundle: nil), forCellReuseIdentifier: "ProductItemTitleCell")
        
        if (product!.image1?.count)! > 0 {
            let imagename = product!.image1?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            let url = kBaseUrl + kProductImageLoad + imagename!
            imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "logo.png"))
        }
        
        lblTitle.text = product?.product_name
        lblGujratiTitle.text = product?.product_gujarati_name
        lblDescription.text = product?.product_description
        
//        if product!.product_attribute.count > 0 {
//            let attributes =  product!.product_attribute.allObjects
//            let att : ProductAttribute = attributes[0] as! ProductAttribute
//            lblPrice.text = "RS \(att.selling_price?.floatValue ?? 0)"
//        }
        
        lblSave.layer.cornerRadius = 5.0
        lblSave.clipsToBounds = true
        
        
        yourViewBorder.strokeColor = UIColor.red.cgColor
        yourViewBorder.lineDashPattern = [4, 4]
        yourViewBorder.frame = lblSave.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: lblSave.bounds).cgPath
        lblSave.layer.addSublayer(yourViewBorder)
        
        tblView.reloadData()
        
        let attributes = product?.product_attribute.allObjects
        if let attt = attributes {
            if attt.count > 0{
                let att = attt[0]
                attribute = (att as! ProductAttribute)
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

//MARK : - IBAction
extension ProductDetailVC{
    
    @IBAction func addToCartClicked() {
        
        Cart.addItem(pro: product!, att: attribute!, qtyy: selectedQty)
        let c = Cart.getAll()
//        print(c)
        
        Utils.showAlert(withMessage: "Item added to cart successfully....")
        
    }
    
    @IBAction func BuyClicked() {
        
        let vc = DeliveryTypeViewController.initViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func zoomClicked(){
        let vc = ProductPopupVC.initViewController(imgArr: [(product?.image1)!,(product?.image2)!])
        let popupVC = PopupViewController(contentController: vc, popupWidth: 320, popupHeight: 400)
        popupVC.backgroundAlpha = 0.3
        popupVC.backgroundColor = .black
        popupVC.canTapOutsideToDismiss = true
        popupVC.cornerRadius = 10
        popupVC.shadowEnabled = true
        // show it by call present(_ , animated:) method from a current UIViewController
        present(popupVC, animated: true)
        
    }
}
//MARK : - UITableView
extension ProductDetailVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (product?.product_attribute.count)! + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0  {
            let cell : ProductItemTitleCell = tableView.dequeueReusableCell(withIdentifier: "ProductItemTitleCell", for: indexPath) as! ProductItemTitleCell
            cell.selectionStyle = .none
            return cell
        }
        
        let cell : ProductItemCell = tableView.dequeueReusableCell(withIdentifier: "ProductItemCell", for: indexPath) as! ProductItemCell
        let attributes = product?.product_attribute.allObjects
        let att : ProductAttribute = attributes![indexPath.row - 1] as! ProductAttribute
        cell.setCellData(att: att)
        cell.btnCheckMark.isSelected = false
        if attribute?.entityid == att.entityid {
            cell.btnCheckMark.isSelected = true
        }
        cell.btnCheckMark.addTarget(self, action: #selector(selectedCheckmark(btn:)), for: .touchUpInside)
        cell.btnCheckMark.tag = indexPath.row
        cell.btnPlus.addTarget(self, action: #selector(plusClicked(btn:)), for: .touchUpInside)
        cell.btnPlus.tag = indexPath.row
        cell.btnMinus.addTarget(self, action: #selector(minusClicked(btn:)), for: .touchUpInside)
        cell.btnMinus.tag = indexPath.row
        cell.selectionStyle = .none
        
        if selectedQty == 0 && indexPath.row == 1{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.selectedCheckmark(btn: cell.btnCheckMark)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func plusClicked(btn : UIButton) {
        let cell : ProductItemCell = tblView.cellForRow(at: NSIndexPath(row: btn.tag, section: 0) as IndexPath) as! ProductItemCell
        let qty : Int = Int((cell.btnTitle.titleLabel?.text)!)!
        let showQty : Int = qty + 1
        cell.btnTitle.setTitle(String(showQty), for: .normal)
        if let att = product?.product_attribute.allObjects[btn.tag - 1] as? ProductAttribute{
            if attribute?.product_id == att.product_id{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.selectedCheckmark(btn: cell.btnCheckMark)
                }
            }
        }
    }
    @objc func minusClicked(btn : UIButton) {
        let cell : ProductItemCell = tblView.cellForRow(at: NSIndexPath(row: btn.tag, section: 0) as IndexPath) as! ProductItemCell
        let qty : Int = Int((cell.btnTitle.titleLabel?.text)!)!
        
        if qty == 1{
            return
        }
        
        let showQty : Int = qty - 1
        cell.btnTitle.setTitle(String(showQty), for: .normal)
        
        if let att = product?.product_attribute.allObjects[btn.tag - 1] as? ProductAttribute{
            if attribute?.product_id == att.product_id{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.selectedCheckmark(btn: cell.btnCheckMark)
                }
                
            }
        }
    }
    
    @objc func selectedCheckmark(btn : UIButton) {
        let cell : ProductItemCell = tblView.cellForRow(at: NSIndexPath(row: btn.tag, section: 0) as IndexPath) as! ProductItemCell
        let qty : Int = Int((cell.btnTitle.titleLabel?.text)!)!
        selectedQty = qty
        let attributes = product?.product_attribute.allObjects
        let att = attributes![btn.tag - 1]
        attribute = (att as! ProductAttribute)
        print((attribute!.mrp!.intValue - attribute!.selling_price!.intValue) * selectedQty)
        
        lblSave.text = "You saved Rs. \((attribute!.mrp!.intValue - attribute!.selling_price!.intValue) * selectedQty)"
        lblSave.layoutIfNeeded()
        yourViewBorder.path = UIBezierPath(rect: lblSave.bounds).cgPath
        tblView.reloadData()
    }
    
}

