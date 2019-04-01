//
//  AppDelegate.swift
//  ShankarMasala
//
//  Created by Narendra Mistri on 14/03/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//
/*Firebase access:
Username: ai.amar.mobile@gmail.com
Password: Amar#123&

Postman access:
Username: shankarmasala.online@gmail.com
Password: kxVVe5SDtfNRevi*/

import UIKit
import AlamofireNetworkActivityLogger
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController : UINavigationController?
    var tabbarController = BaseTabBarController()
    var leftViewController : MenuVC?
    var slideMenuController : SlideMenuController?
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCoredata()
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
        
        NotificationCenter.default.addObserver(self, selector: #selector(showLogin), name: NSNotification.Name(rawValue: "START_CLICKED"), object: nil)
        self.tabbarController = BaseTabBarController.initViewController()
        self.leftViewController = MenuVC.initViewController()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 223.0/255.0, green: 39.0/255.0, blue:54.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        barButtonAppearance.tintColor = UIColor.red
//        UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearance];
//        [barButtonAppearance setTintColor:[UIColor blackColor]];
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if AccountManager.instance().activeAccount != nil {
            let acc = AccountManager.instance().activeAccount!
            if acc.verification_key.count > 0{
                showHome()
            }else{
                self.showLogin()
            }
        }else{
            self.showLogin()
        }
        
      //  showHome()
        
        
        
        return true
    }

    class func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    func clearDatabase(){
        MagicalRecord.save(blockAndWait: { (localContext:NSManagedObjectContext) in
        })
    }
    
    //MARK:- Private [Method]
    private func setupCoredata(){
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "ShankarMasala.sqlite")
        let paths: [Any] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print("path  = \(paths)")
    }
    func initWalkScreen(){
        
        let vc0 = WalkScreenVC.initViewController(page: 0)
        let vc1 = WalkScreenVC.initViewController(page: 1)
        let vc2 = WalkScreenVC.initViewController(page: 2)
        let pages = PagesController.init([vc0,vc1,vc2])
        self.window?.rootViewController = pages
        self.window?.makeKeyAndVisible()
    }
    
    @objc func showLogin() {
        let vc = LoginVC.initViewController()
        navigationController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    @objc func logout() {
        AccountManager.instance().activeAccount = nil
        showLogin()
    }
    
    @objc func showHome() {
        slideMenuController = SlideMenuController(mainViewController: self.tabbarController, leftMenuViewController: leftViewController!, rightMenuViewController: leftViewController!)
        SlideMenuOptions.contentViewScale = 1
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
    }
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

