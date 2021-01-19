//
//  EditProfileVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/9/21.
//

import UIKit
// MARK:- Protocols
protocol EditProfileProtocol: class {
    func hideLoader()
    func showLoader()
    func showError(title: String , massage: String)
    func showAlert(title: String , massage: String)
}
class EditProfileVC: UIViewController {

    // MARK:- Outlets
    @IBOutlet var editProfileView: EditProfileView!
    private var editViewModel: EditProfileViewModel!
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileView.updateUI()
        setupNavigation1(view: self, settingAcion: nil, backAcion: #selector(backBtnTapped), title: L10n.ediTuser , backColor: UIColor(named: ColorName.veryLightPink), tintColor: .darkGray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editViewModel.fetchUserInfo { 
            self.editProfileView.setUserData(data: self.editViewModel.returnUserData())
        }
    }
    
    // MARK:- saveFunction
    @IBAction func saveProfilePressed(_ sender: UIButton) {
        editViewModel.tryToSaveData(name: editProfileView.nameTF.text!, email: editProfileView.emailTF.text!, mobile: editProfileView.phone.text!, oldPassord: editProfileView.oldPass.text ?? "", Password: editProfileView.newPassTF.text ?? "", confirmPass: editProfileView.reNewPassTF.text ?? "")
    }
    
    @IBAction func cancelProfilePressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK:- navMedthods
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:- Public Methods
    class func create() -> EditProfileVC {
        let editVC: EditProfileVC = UIViewController.create(storyboardName: Storyboards.EditProfile, identifier: ViewControllers.EditProfileVC)
        editVC.editViewModel = EditProfileViewModel(view: editVC)
        return editVC
    }

}
extension EditProfileVC: EditProfileProtocol {
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
}
