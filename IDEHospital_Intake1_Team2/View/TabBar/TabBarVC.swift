//
//  TabBarVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/16/20.
//

import UIKit


class TabBarVC: UITabBarController {
    
    let searchNavigation = UINavigationController()
    let favouriteNavigation = UINavigationController()
    let schdualNavigation = UINavigationController()
    var mainID: Int = 0 {
        didSet {
            setViewControllers()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarView()
    }
    private func setupTabBarView(){
        tabBar.backgroundColor = UIColor(named: ColorName.veryLightPink)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    private func setSearchTab() {
        let searchVC = SearchVC.create(id: mainID)
        searchVC.tabBarItem.image = Asset.component411.image.withRenderingMode(.alwaysOriginal)
        searchVC.title = "Search"
        
        searchNavigation.viewControllers = [searchVC]
    }
    
    private func setFavouriteTab() {
        let favVC = FavouriteVC.create()
        favVC.tabBarItem.image = Asset.heart.image.withRenderingMode(.alwaysOriginal)
        favVC.title = "Favourite"
        favVC.tabBarItem.selectedImage = Asset.heart.image
        favouriteNavigation.viewControllers = [favVC]
    }
    
    private func setSchedualTab() {
        let schedualVC = AppointmentVC.create()
        schedualVC.tabBarItem.image = Asset.calendar3.image.withRenderingMode(.alwaysOriginal)
        schedualVC.title = "SchedualVC"
        schedualVC.tabBarItem.selectedImage = Asset.calendar3.image
        schdualNavigation.viewControllers = [schedualVC]
    }
    private func setViewControllers() {
        setSearchTab()
        setFavouriteTab()
        setSchedualTab()
        self.viewControllers = [searchNavigation, favouriteNavigation, schdualNavigation]
        self.selectedIndex = 0
        for vc in self.viewControllers! {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        }
    }
    
}

