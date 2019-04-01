
import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.size.height / 2
//        layer.backgroundColor = buttonBackgroundColor
    }
}
