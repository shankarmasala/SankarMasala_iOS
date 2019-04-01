

import UIKit
import CountdownLabel
class OtpVC: UIViewController {

    @IBOutlet weak var otpView: VPMOTPView!
    @IBOutlet weak var lblMobileNumber: UILabel!
    @IBOutlet weak var lblTimeOut: CountdownLabel!

    
    var enteredOtp: String = ""
    
    class func initViewController() -> OtpVC{
        let vc = OtpVC(nibName: "OtpVC", bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let acc = AccountManager.instance().activeAccount
        
         let mobile_number = acc?.mobile_number
        let string = NSMutableAttributedString(string: "Please Type Verification code Sent to \(mobile_number ?? "")")
        string.setColorForText(mobile_number!, with: .orange)
       
        lblMobileNumber.attributedText = string
        //let time = "01:48"
        lblTimeOut.timeFormat = "mm:ss"
        lblTimeOut.setCountDownTime(minutes: 120)
        lblTimeOut.textColor = .red
        lblTimeOut.start()
        
       // lblTimeOut.text = "Please wait \(time)"//01:48
        
    //    otpView.otpFieldsCount = 7
    
        otpView.otpFieldDefaultBorderColor = UIColor.black
        otpView.otpFieldEnteredBorderColor = UIColor.orange
        otpView.otpFieldErrorBorderColor = UIColor.red
        otpView.otpFieldBorderWidth = 2
        otpView.otpFieldInputType = .numeric
        
        otpView.delegate = self
        otpView.otpFieldDisplayType = .underlinedBottom
        otpView.shouldAllowIntermediateEditing = false
    
        
        // Create the UI
        otpView.initializeUI()
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
extension OtpVC: VPMOTPViewDelegate {
    func hasEnteredAllOTP(hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        
        return enteredOtp == "12345"
    }
    
    func shouldBecomeFirstResponderForOTP(otpFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otpString: String) {
        enteredOtp = otpString
        print("OTPString: \(otpString)")
        
    }
}


//MARK : Button Action

extension OtpVC{
    @IBAction func sendOTPClicked() {
        let  otp = enteredOtp.trimmingCharacters(in: .whitespaces)
        if otp.count == 6 {
            let acc : Account = AccountManager.instance().activeAccount!
            acc.verification_key = otp
            LoaderView.displaySpinner()
            acc.login { (isSuccess, account, message) -> (Void) in
                LoaderView.removeSpinner()
                if message.count > 0 {
                    Utils.showAlert(withMessage: message)
                    return
                }
                AccountManager.instance().activeAccount = account
                AppDelegate.shared().showHome()
            }
        }else{
            Utils.showAlert(withMessage: "Please enter valid OTP.")
        }
    }
    @IBAction func didnotReceiveCodeClicked() {
        otpView.resignFirstResponder()
        self.lblTimeOut.cancel()
        let acc : Account = AccountManager.instance().activeAccount!
        LoaderView.displaySpinner()
        acc.register{ (isSuccess, account, message) -> (Void) in
            LoaderView.removeSpinner()
            if message.count > 0 {
                Utils.showAlert(withMessage: message)
                return
            }
            
            self.lblTimeOut.timeFormat = "mm:ss"
            self.lblTimeOut.setCountDownTime(minutes: 120)
            self.lblTimeOut.textColor = .red
            self.lblTimeOut.start()
            AccountManager.instance().activeAccount = account
        }
    }
    
    
}
