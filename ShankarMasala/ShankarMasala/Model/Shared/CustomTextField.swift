
import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var inset: CGFloat = 28
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 18
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 232.0/255.0, green: 113.0/255.0, blue: 120.0/255.0, alpha: 1.0).cgColor
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy:0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
