//
//  UIViewController+SetNavigation.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/22/20.
//

import UIKit
extension UIViewController {
    func setupNavigation(view: UIViewController, settingAcion: Selector?, backAcion: Selector?, title: String){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: topPadding , width: view.view.frame.size.width, height: 47))
        
        view.view.addSubview(navBar)
        let navItem = UINavigationItem(title: title)
        navBar.barTintColor =  UIColor(named: ColorName.veryLightPink)
        navItem.rightBarButtonItem = UIBarButtonItem(image: Asset.settings.image, style: .done, target: view,  action: settingAcion)
        navItem.leftBarButtonItem = UIBarButtonItem(image: Asset.back2.image, style: .done, target: view,  action: backAcion)
        navItem.leftBarButtonItem?.tintColor = .darkGray
        navItem.rightBarButtonItem?.tintColor = .darkGray
        navBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 20)]
        
        
        navBar.setItems([navItem], animated: false)
        
        
    }
    
    
    func setupNavigation1(view: UIViewController, settingAcion: Selector?, backAcion: Selector?, title: String, backColor: UIColor, tintColor: UIColor){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: topPadding , width: view.view.frame.size.width, height: 47))
        
        view.view.addSubview(navBar)
        let navItem = UINavigationItem(title: title)
        navBar.barTintColor =  backColor
        navItem.leftBarButtonItem = UIBarButtonItem(image: Asset.back2.image, style: .done, target: view,  action: backAcion)
        navItem.leftBarButtonItem?.tintColor = tintColor
        navBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 20)]
        
        
        navBar.setItems([navItem], animated: false)
        
    }
}
