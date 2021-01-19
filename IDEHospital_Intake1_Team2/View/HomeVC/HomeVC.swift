//
//  ViewController.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import UIKit
import Kingfisher
protocol HomeVCProtocol: class {
    func showLoader()
    func hideLoader()
    func showAlert(title: String , massage: String)
}

class HomeVC: UIViewController {
    
    // MARK:- outlets
    @IBOutlet var homeView: HomeView!
    private var categoryViewModel: CategoryViewModelProtocol!

    // MARK:- Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaultsManager.shared().token)
        homeView.updateUI()
        navigationController?.isNavigationBarHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        categoryViewModel.readMainCategory {
            self.designCategories()
        }
    }
    
    // MARK:- Intialize ViewWController
    class func create() -> HomeVC {
        let homeVC: HomeVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.homeVC)
        homeVC.categoryViewModel = CategoryViewModel(view: homeVC)
        return homeVC
    }
    
    // MARK:- CategoryChoosen
    @IBAction func categoryChoosenPressed(_ sender: UIButton) {
        let tabbar = TabBarVC()
        tabbar.modalPresentationStyle = .fullScreen
        if sender.tag == 0 {
            tabbar.mainID = categoryViewModel.sendMainCategory()[0].id!
            self.present(tabbar, animated: true, completion: nil)
        }
        else if sender.tag == 1 {
            tabbar.mainID = categoryViewModel.sendMainCategory()[1].id!
            self.present(tabbar, animated: true, completion: nil)
        }
        else if sender.tag == 2 {
            tabbar.mainID = categoryViewModel.sendMainCategory()[2].id!
            self.present(tabbar, animated: true, completion: nil)
        }
        else if sender.tag == 3 {
            // Nurse Home
            let nurse = NurseVC.create(checkContact: false)
            navigationController?.pushViewController(nurse, animated: true)
        }
        
    }
    
}
extension HomeVC: HomeVCProtocol {
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    func showAlert(title: String , massage: String) {
        let alertPayload = AlertPayload(img:Asset.errorBook.image,message: massage) {
            //self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
}

extension HomeVC {
    func designCategories(){
        let catInfo = categoryViewModel.sendMainCategory()
        homeView.setHomeView(categoryInfo: catInfo)
    }
}
