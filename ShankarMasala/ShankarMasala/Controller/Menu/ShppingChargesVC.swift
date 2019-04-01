//
//  ShppingChargesVC.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 23/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class ShppingChargesVC: BaseVC {
    
    @IBOutlet weak var tblView: UITableView!
    
    class func initViewController() -> ShppingChargesVC {
        let vc = ShppingChargesVC.init(nibName: "ShppingChargesVC", bundle: nil)
        vc.title = "Countries & Cities"
        return vc
    }
    
    var sections = sectionsData
    
    
    override func viewDidLoad() {
        self.isBackButton = true
        super.viewDidLoad()
        
        LoaderView.displaySpinner()
        Manager.loadCountryStates { (result, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            self.sections = [Section]()
            let country = CountryObject.getAll()
            
            var items = [Item]()
            for con in country!{
                let states : [State] = con.states.allObjects as! [State]
                for state in states{
                    let someString = state.state_id
                    if let myInteger = Int(someString!) {
                        let myNumber = NSNumber(value:myInteger)
                        let it = Item(name: state.state_name ?? "", detail: "", cityId:myNumber  )
                        items.append(it)
                    }
                }
                let sec = Section(name: con.country_name ?? "", items:items)
                self.sections.append(sec)
            }
            
            self.tblView.reloadData()
            
        }
        
        tblView.estimatedRowHeight = 44.0
        tblView.rowHeight = UITableView.automaticDimension
        
        
    }
    
    
    
    
    
    // Do any additional setup after loading the view.
}


extension ShppingChargesVC: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tblView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
//
// MARK: - View Controller DataSource and Delegate
//
extension ShppingChargesVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.nameLabel.font = UIFont(name: cell.nameLabel.font.fontName, size: 14)
        cell.nameLabel.textColor = UIColor.darkGray
        cell.detailLabel.text = item.detail
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        //  header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        let idd : String = "\(item.entityid)"
        let state = State.getById(stateid: idd)
        let vc = ShippingDetailVC.initViewController(state: state!)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
