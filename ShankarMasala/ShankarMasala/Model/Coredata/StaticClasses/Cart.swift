import Foundation
import FastEasyMapping
import MagicalRecord
@objc(Cart)
open class Cart: _Cart {
    
    class func getAll() -> [Cart]? {
        return Cart.mr_findAllSorted(by: "create_date", ascending: true)  as? [Cart]
    }
    
    class func getCount() -> Int? {
        var count : Int = 0
        let carts = Cart.getAll()
        for c in carts! {
            count = count + (c.qty?.intValue)!
        }
        return count
    }
    
    class func newEntity() -> Cart? {
        let new = Cart.mr_createEntity(in: NSManagedObjectContext.mr_default())
        return new
    }
    
    class func addItem(pro : Product , att : ProductAttribute ) {
        if ((exitingItem(pro: pro, att: att)) != nil) {
            let cart = Cart.exitingItem(pro: pro, att: att)
            cart?.qty = NSNumber(value: (cart?.qty?.intValue)! + 1)
            cart?.product = pro
            cart?.productAttribute = att
            cart?.save()
        }else{
            let cart = newEntity()
            cart?.qty = 1
            cart?.product = pro
            cart?.productAttribute = att
            cart?.save()
        }
        NotificationCenter.default.post(name: NSNotification.Name("update_cart_count"), object: nil)
    }

    
    class func removeItem(pro : Product , att : ProductAttribute) {
        if ((exitingItem(pro: pro, att: att)) != nil) {
            let cart = Cart.exitingItem(pro: pro, att: att)
            cart?.qty = NSNumber(value: (cart?.qty?.intValue)! - 1)
            cart?.product = pro
            if (cart?.qty?.intValue)! <= 0 {
                cart?.delete()
            }
            cart?.save()
            
            NotificationCenter.default.post(name: NSNotification.Name("update_cart_count"), object: nil)
        }
    }
    
    class func exitingItem(pro : Product , att : ProductAttribute) -> Cart? {
        let arr = Cart.getAll()
        for c in arr! {
            let left = (c.productAttribute?.weight!)! + " " + (c.productAttribute?.unit!)!
            let right = (att.weight!) + " " + (att.unit!)
            if c.product?.entityid == pro.entityid && left == right{
                return c
            }
        }
        return nil
    }

    
    func findByWeightUnitItem(weight_unit : String) -> ProductAttribute? {
        let arr = self.product?.product_attribute.allObjects as? [ProductAttribute]
        for pa in arr!{
            let left = "\(pa.weight!) \(pa.unit!)"
            if left == weight_unit{
                return pa
            }
        }
        return nil
    }
    
    func refreshCart(){
        NSManagedObjectContext.mr_default().refresh(self, mergeChanges: false)
    }
    
    func save(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
        NotificationCenter.default.post(name: NSNotification.Name("update_cart_count"), object: nil)
    }
    
    func delete(){
        self.mr_deleteEntity()
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
         NotificationCenter.default.post(name: NSNotification.Name("update_cart_count"), object: nil)
    }
}

extension Cart{
   class func getTotal() -> Float {
        var total : Float = 0
        let arr = Cart.getAll()
        for c in arr! {
            let qty : Float = (c.qty?.floatValue)!
            total = total + ((c.productAttribute?.selling_price?.floatValue)! * qty)
        }
        return total
    }
}
