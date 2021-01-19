//
//  SignUpVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import UIKit

// MARK:- Protocols
protocol SignUpProtocol: class {
    func hideLoader()
    func showLoader()
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
    func showAlert(title: String , massage: String)
}

class SignUpVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var signUpView: SignUpView!
    
    // MARK: - Properties
    private var viewModel: SignUpViewModelProtocol!
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.setup()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.navSignUp)
        
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
    
    @IBAction func signUpBtn(_ sender: Any) {
        viewModel.tryToSaveUser(name: signUpView.userNameTextField.text!, email: signUpView.emailTextField.text!, mobile: signUpView.mobileNumTextFiled.text!, Password: signUpView.choosePassowordTextField.text!, confirmPass: signUpView.confirmPasswordTextField.text!)
    }
    
    // MARK:- Public Methods
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.signUpVc)
        signUpVC.viewModel = SignUpViewModel(view: signUpVC)
        return signUpVC
    }
    @IBAction func termPressed(_ sender: Any) {
        let about = AboutUsVC.create(isAbout: false)
        self.navigationController?.pushViewController(about, animated: true)
    }
}

// MARK: - Implement Protocols
extension SignUpVC: SignUpProtocol{
    func showError(title: String , massage: String) {
        let alertPayload = AlertPayload(img:Asset.errorBook.image,message: massage) {
            //self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    func showAlert(title: String , massage: String) {
        let alertPayload = AlertPayload(img: Asset.successAlert.image,message: massage) {
            AppDelegate.shared().switchToHomwState()
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
        guard  let name = signUpView.userNameTextField.text,
            !name.isEmpty,
            let email = signUpView.emailTextField.text,!email.isEmpty,
            let mobile = signUpView.mobileNumTextFiled.text,!mobile.isEmpty,
            let choosePassoword = signUpView.choosePassowordTextField.text,!choosePassoword.isEmpty,
            let confirmPassword = signUpView.confirmPasswordTextField.text,!confirmPassword.isEmpty
            
            else {return false}
        return true
    }
    func Empty() {
        switch  check() {
        case !signUpView.userNameTextField.text!.isEmpty:
            showError(title: "Email", massage: "Please write your name")
        case !signUpView.emailTextField.text!.isEmpty:
            showError(title: "Email", massage: "Please write your Email")
        case !signUpView.mobileNumTextFiled.text!.isEmpty:
            showError(title: "Email", massage: "Please write Phone Numbers")
        case !signUpView.choosePassowordTextField.text!.isEmpty:
            showError(title: "Email", massage: "Please write Password")
        case !signUpView.confirmPasswordTextField.text!.isEmpty:
            showError(title: "Email", massage: "Please write Password Again")
        default:
            print("error")
            
        }
    }
    
}

