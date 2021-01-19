//
//  RegisterVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 1/9/21.
//

import UIKit

// MARK:- Protocols
protocol RegisterProtocol: class {
    func hideLoader()
    func showLoader()
    func showError(title: String , massage: String)
    func showAlert(title: String , massage: String)
}

class RegisterVC: UIViewController {
    // MARK:- Outlets
    @IBOutlet var registView: RegisterView!
    
    // MARK: - Properties
    private var viewModel: RegisterViewModelProtocol!
    
    var anotherCheck = false
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registView.setup()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        registView.overlayView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender:UITapGestureRecognizer){
        if !registView.overlayView.isHidden {
            self.dismiss(animated: true, completion: nil)
      }
    }
    
    // MARK:- Button Methods
    @IBAction func registBtn(_ sender: Any) {
        
        registView.changeView(bool: false)
    }
    @IBAction func loginBtn(_ sender: Any) {
        registView.changeView(bool: true)
    }
    @IBAction func signUpOrLoginBtn(_ sender: UIButton) {
        if registView.SignUpBtn.titleLabel?.text == L10n.popSignUpp{
            viewModel.tryToSaveUser(name: registView.userNameTextField.text!, email: registView.emailTextField.text!, mobile: registView.mobileNumTextFiled.text!, Password: registView.choosePassowordTextField.text!, patientName: registView.anotherTextField.text ?? "", book_for_another: anotherCheck, voucher: registView.voucherCodeTextField.text ?? "")
        }
        else {
            viewModel.tryTologin(email: registView.emailTextField.text!, Password: registView.choosePassowordTextField.text!, patientName: registView.anotherTextField.text ?? "", book_for_another: anotherCheck, voucher: registView.voucherCodeTextField.text ?? "")
        }
    }
    
    
    @IBAction func termPressed(_ sender: Any) {
        let term = AboutUsVC.create(isAbout: false)
        term.modalPresentationStyle = .fullScreen
        term.modalTransitionStyle = .crossDissolve
        term.isBook = true
        self.present(term, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        registView.voucherCheck.backgroundColor = UIColor(patternImage: Asset.outputOnlinepngtools.image)
    }
    @IBAction func voucherCheckBrn(_ sender: UIButton) {
        
        if sender.isSelected{
            registView.voucherOutBtn.setImage(Asset.rectangle1798.image, for: .normal)
            registView.voucherCodeTextField.isEnabled = false
            registView.voucherCodeTextField.text = ""
            sender.isSelected = false
        }
        else{
            registView.voucherOutBtn.setImage(Asset.outputOnlinepngtools.image, for: .normal)
            registView.voucherCodeTextField.isEnabled = true
            sender.isSelected = true
        }
    }
    
    @IBAction func anotherCheckBtn(_ sender: UIButton) {
        if sender.isSelected{
            registView.anotherOutbtn.setImage(Asset.rectangle1798.image, for: .normal)
            registView.anotherTextField.isEnabled = false
            registView.anotherTextField.text = ""
            anotherCheck = false
            sender.isSelected = false
        }
        else{
            registView.anotherOutbtn.setImage(Asset.outputOnlinepngtools.image, for: .normal)
            registView.anotherTextField.isEnabled = true
            anotherCheck = true
            sender.isSelected = true
        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Public Methods
    class func create(id: Int, appoint: Int) -> RegisterVC {
        let registerVC: RegisterVC = UIViewController.create(storyboardName: Storyboards.register, identifier: ViewControllers.registerVC)
        registerVC.viewModel = RegisterViewModel(view: registerVC, id: id, appoint: appoint)
        return registerVC
    }
    
}
// MARK: - Implement Protocols
extension RegisterVC: RegisterProtocol{
    func showError(title: String , massage: String) {
        let alertPayload = AlertPayload(img:Asset.errorBook.image,message: massage) {
            //self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    func showAlert(title: String , massage: String) {
        let alertPayload = AlertPayload(img: Asset.successAlert.image,message: massage) {
            self.dismiss(animated: true, completion: nil)
            //AppDelegate.shared().switchToHomwState()
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    
}
