//
//  SignInVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import UIKit

// MARK:- Protocols
protocol SignInProtocol: class {
    func hideLoader()
    func showLoader()
    func check() -> Bool
    func Empty()
    func showError(title: String , massage: String)
    func showAlert(title: String , massage: String)
}
class SignInVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var SignInView: SignInView!
    
    // MARK: - Properties
    private var viewModel: SignInViewModelProtocol!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInView.setup()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.navSignIn)
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
    @IBAction func loginBtn(_ sender: Any) {
        viewModel.tryTologin(email: SignInView.emailTextField.text!, Password: SignInView.passTextField.text!)
    }
    @IBAction func signUpBtn(_ sender: Any) {
        let signUp = SignUpVC.create()
        self.navigationController?.pushViewController(signUp, animated: true)

    }
    @IBAction func forgetBtn(_ sender: Any) {
        let reset = ResetPasswordVC.create()
        self.navigationController?.pushViewController(reset, animated: true)

    }
    
    // MARK:- Public Methods
    class func create() -> SignInVC {
        let signInVC: SignInVC = UIViewController.create(storyboardName: Storyboards.auth, identifier: ViewControllers.signInVC)
        signInVC.viewModel = SignInViewModel(view: signInVC)
        return signInVC
    }
}
// MARK: - Implement Protocols
extension SignInVC: SignInProtocol{
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
    func hideLoader() {
        self.view.hideLoader()
    }
    func check() -> Bool {
        guard let email = SignInView.emailTextField.text,!email.isEmpty,
            let passoword = SignInView.passTextField.text,!passoword.isEmpty
            else {return false}
        return true
    }
    func Empty() {
        switch  check() {
        case !SignInView.emailTextField.text!.isEmpty:
            showError(title: "Email", massage: "Please write your email")
        case !SignInView.passTextField.text!.isEmpty:
            showError(title: "Email", massage: "Please write your Password")
            
        default:
            print("error")
            
        }
    }
    
}
extension UINavigationController {
        
    func backToViewController(viewController: Swift.AnyClass) {
        for element in viewControllers as Array {
            if element.isKind(of: viewController) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
    
}
