//
//  AppDelegate.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        switchToHomwState()
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        return true
    }
    
    func switchToHomwState() {
        let homeVC = HomeVC.create()
        let navigationController = UINavigationController(rootViewController: homeVC)
        self.window?.rootViewController = navigationController
    }
    
    
}
extension AppDelegate {
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
