//
//  ResetPasswordVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import UIKit

// MARK:- Protocols
protocol ResetPasswordProtocol: class{
    func hideLoader()
    func showLoader()
    func check() -> Bool
    func showAlert(title: String , massage: String)
    func showError(title: String , massage: String)
}

class ResetPasswordVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var resetPassView: ResetPasswordView!
    
    // MARK: - Properties
    private var viewModel: ResetPassViewModelProtocol!
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.navReset)
        resetPassView.setup()
        
    }
    // MARK:- Button Methods
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    @IBAction func sendNewPass(_ sender: Any) {
        viewModel.forgetPass(email: resetPassView.emailTextField.text!)
    }
    
    // MARK:- Public Methods
    class func create() -> ResetPasswordVC {
        let resetPasswordVC: ResetPasswordVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.resetPasswordVC)
        resetPasswordVC.viewModel = ResetPassViewModel(view: resetPasswordVC)
        return resetPasswordVC
    }
    
}

// MARK: - Implement Protocols
extension ResetPasswordVC: ResetPasswordProtocol {
    func showAlert(title: String , massage: String) {
        let alertPayload = AlertPayload(img: Asset.successAlert.image,message: massage) {
            AppDelegate.shared().switchToHomwState()
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    func showError(title: String , massage: String) {
        let alertPayload = AlertPayload(img:Asset.errorBook.image,message: massage) {
            //self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    func check() -> Bool {
        guard let email = resetPassView.emailTextField.text,!email.isEmpty
            else {return false}
        return true
    }
    
    
    
}
