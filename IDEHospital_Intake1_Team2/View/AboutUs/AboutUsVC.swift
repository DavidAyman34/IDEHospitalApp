//
//  AboutUsVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import UIKit
protocol AboutUsVCProtocol: class {
    func showLoader()
    func hideLoader()
}
class AboutUsVC: UIViewController {
    
    // MARK:- outlets
    @IBOutlet var aboutView: AboutView!
    private var aboutUsViewModel: AboutUsViewModal!
    var isBook = false
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.updateUI()
        setupNavigation1(view: self, settingAcion: nil, backAcion: #selector(backBtnTapped), title: aboutUsViewModel.sendTitle(), backColor: UIColor(named: ColorName.veryLightPink), tintColor: .darkGray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aboutUsViewModel.getAboutUsInfo {
            self.aboutView.aboutLabel.attributedText = self.conv(str: self.aboutUsViewModel.sendAboutUs())
            self.aboutView.aboutLabel.textColor = .white
        }
    }
    
    // MARK:- navMethods
    @objc func backBtnTapped() {
        if isBook == true {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    class func create(isAbout: Bool) -> AboutUsVC {
        let aboutUsVC: AboutUsVC = UIViewController.create(storyboardName: Storyboards.AboutUs, identifier: ViewControllers.AboutUsVC)
        aboutUsVC.aboutUsViewModel = AboutUsViewModal(view: aboutUsVC,checkAbout: isAbout)
        return aboutUsVC
    }
    
}

extension AboutUsVC:AboutUsVCProtocol {
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
}
