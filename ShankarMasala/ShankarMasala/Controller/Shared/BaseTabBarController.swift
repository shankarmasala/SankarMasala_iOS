
import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var lblCount = UILabel(frame: CGRect(x: UIScreen.main.bounds.width - 48, y: UIScreen.main.bounds.height - 80, width: 15, height: 15))
    
    class func initViewController() -> BaseTabBarController {
        let controller = BaseTabBarController()
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateCartCount), name: NSNotification.Name("update_cart_count"), object: nil)
        lblCount.font = UIFont(name: lblCount.font.familyName, size: 10)
        lblCount.textAlignment = .center
        lblCount.textColor = UIColor.red
        self.view.addSubview(lblCount)
        
        self.delegate = self
        setViews()
        self.perform(#selector(updateCartCount), with: nil, afterDelay: 1.0)
    }
    
    @objc func updateCartCount() {
        let count = Cart.getCount()
        lblCount.text = "\(count ?? 0)"
        
    }
    
    @objc func setViews ()  {
        self.tabBar.tintColor = UIColor.black
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
        self.tabBar.barTintColor = UIColor(red: 255/255, green: 178/255, blue: 62/255, alpha: 1.0)
        
        
        
        
        let vc1 = HomeVC.initViewController()
        let vc2 = OfferVC.initViewController()
        let vc3 = SearchVC.initViewController()
        let vc4 = CategoryVC.initViewController()
        let vc5 = CartVC.initViewController()
        
        let homeTab = UITabBarItem()
        homeTab.tag = 0
        homeTab.image = UIImage(named: "homeTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homeTab.selectedImage = UIImage(named: "homeTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homeTab.title = "HOME"
        vc1.tabBarItem = homeTab
        
        
        let offerTab = UITabBarItem()
        offerTab.tag = 1
        offerTab.image = UIImage(named: "offerTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        offerTab.selectedImage = UIImage(named: "offerTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        offerTab.title = "OFFERS"
        vc2.tabBarItem = offerTab
        
        
        let searchTab = UITabBarItem()
        searchTab.tag = 2
        searchTab.image = UIImage(named: "searchTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        searchTab.selectedImage = UIImage(named: "searchTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        searchTab.title = "SEARCH"
        vc3.tabBarItem = searchTab
        
        
        let categoryTab = UITabBarItem()
        categoryTab.tag = 3
        categoryTab.image = UIImage(named: "categoryTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        categoryTab.selectedImage = UIImage(named: "categoryTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        categoryTab.title = "CATEGORY"
        vc4.tabBarItem = categoryTab
        
        
        let cartTab = UITabBarItem()
        cartTab.tag = 4
        cartTab.image = UIImage(named: "cartTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        cartTab.selectedImage = UIImage(named: "cartTabbar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        cartTab.title = "CART"
        vc5.tabBarItem = cartTab
      
        let nav1 = UINavigationController.init(rootViewController: vc1)
        let nav2 = UINavigationController.init(rootViewController: vc2)
        let nav3 = UINavigationController.init(rootViewController: vc3)
        let nav4 = UINavigationController.init(rootViewController: vc4)
        let nav5 = UINavigationController.init(rootViewController: vc5)
        
        setNavBar(nav: nav1)
        setNavBar(nav: nav2)
        setNavBar(nav: nav3)
        setNavBar(nav: nav4)
        setNavBar(nav: nav5)
        
        let controllers = [nav1, nav2, nav3, nav4, nav5]
        self.viewControllers = controllers
        self.selectedViewController = nav1
        
        
       
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
//        var tabFrame = self.tabBar.frame
//        var aHeight : CGFloat = 60;
//
//        if UIDevice.IS_IPHONNE_X_XS || UIDevice.IS_IPHONE_XR_XSMAX {
//            aHeight = 100;
//        } else {
//            aHeight = tabFrame.size.height
//        }
//
//        tabFrame.size.height = aHeight
//        tabFrame.origin.y = self.view.frame.size.height - aHeight
//        self.tabBar.frame = tabFrame
    }
    
    func setNavBar(nav:UINavigationController) {
        nav.navigationBar.barTintColor = UIColor.white
        nav.navigationBar.tintColor = UIColor.black
        nav.navigationBar.isTranslucent = false
    }
    
    func changeTabIndex(index: Int, isRootVc: Bool){
        self.selectedIndex = index
        if isRootVc {
            let nav: UINavigationController = (self.selectedViewController as? UINavigationController)!
            nav.popToRootViewController(animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
