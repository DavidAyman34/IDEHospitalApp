//
//  EditProfileViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/9/21.
//

import Foundation
// MARK:- Protocol Methods
protocol EditProfileViewModelProtocol {
    func tryToSaveData(name: String, email: String, mobile: String, oldPassord: String ,Password: String, confirmPass: String)
    func fetchUserInfo(completion: @escaping()->Void)
    func returnUserData()-> userInfo
}
class EditProfileViewModel{
    
    // MARK:- Properties
    weak var view: EditProfileProtocol!
    var userData = userInfo(email: "", name: "", mobile: "", accessToken: "")
    var userInf = saveUserResponse(name: "", email: "", mobile: "", password: "", old_password: "")
    
    // MARK:- Initialization Methods
    init(view: EditProfileProtocol) {
        self.view = view
    }
    
    func valid(name: String?, email:String?, mobile: String?, oldPassord: String ,Password: String, confirmPass: String) -> Bool {
        if !oldPassord.isEmpty {
            let response = Validation.shared.validate(values: (type: Validation.ValidationType.alphabeticString, name!),(Validation.ValidationType.email, email!),(Validation.ValidationType.phoneNo, mobile!),(Validation.ValidationType.password, oldPassord),(Validation.ValidationType.password, Password),(Validation.ValidationType.password, confirmPass))
            switch response {
            case .success:
                return true
                
            case .failure(_, let message):
                print(message.localized())
                view.showError(title: "", massage: message.localized())
                return false
                
            }
        }
        else {
            let response = Validation.shared.validate(values: (type: Validation.ValidationType.alphabeticString, name!),(Validation.ValidationType.email, email!),(Validation.ValidationType.phoneNo, mobile!))
            switch response {
            case .success:
                return true
                
            case .failure(_, let message):
                print(message.localized())
                view.showError(title: "", massage: message.localized())
                return false
                
            }
        }
        
        
    }
}
// MARK: - Implement Protocols
extension EditProfileViewModel: EditProfileViewModelProtocol {
    func returnUserData() -> userInfo {
        return userData
    }
    
    func fetchUserInfo(completion: @escaping()->Void) {
        self.view.showLoader()
        APIManager.getUserData { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                self.view.hideLoader()
                self.userData = result.data ?? userInfo(email: "", name: "", mobile: "", accessToken: "")
                completion()
            }
        }
    }
    func saveUser(data: saveUserResponse){
        APIManager.saveUserData(data: data) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                if result.code == 401 {
                    self.view.showError(title: "", massage: L10n.oldPassword)
                }
                else if result.code == 422 {
                    self.view.showError(title: "", massage: L10n.wrongPassword)
                }
                else {
                    self.view.showAlert(title: "", massage: L10n.success)
                }
            }
        }
    }
    
    
    func tryToSaveData(name: String, email: String, mobile: String, oldPassord: String ,Password: String, confirmPass: String) {
        if valid(name: name, email: email, mobile: mobile, oldPassord: oldPassord, Password: Password, confirmPass: confirmPass) {
            if Password == confirmPass {
                userInf = saveUserResponse(name: name, email: email, mobile: mobile, password: Password, old_password: oldPassord)
                saveUser(data: userInf)
            }
            else {
                self.view.showError(title: "", massage: L10n.confirmError)
            }
        }
    }
}

