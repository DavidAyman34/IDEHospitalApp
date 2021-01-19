//
//  SignUpViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import Foundation

// MARK:- Protocol Methods
protocol SignUpViewModelProtocol {
    func tryToSaveUser(name: String, email: String, mobile: String, Password: String, confirmPass: String)
    
}
class SignUpViewModel{
    
    // MARK:- Properties
    weak var view: SignUpProtocol!
    
    // MARK:- Initialization Methods
    init(view: SignUpProtocol) {
        self.view = view
    }
    
    // MARK:- Private Methods
    private func sendUser(name: String, email: String, mobile: String, password: String){
        self.view!.showLoader()
        APIManager.saveUser(name: name, email: email, phone: mobile, password: password) { (respone) in
            switch respone{
            case .failure(let error):
                print(error)
                
            case .success(let result):
                print(result)
                if result.code == 422 {
                    self.view.showError(title: "Error", massage: "The email has already been taken.")
                }
                else{
                    self.view!.showAlert(title: "Succeed", massage: "Registration successful")
                    
                }
            }
        }
        self.view!.hideLoader()
    }
    
}




// MARK: - Implement Protocols
extension SignUpViewModel: SignUpViewModelProtocol{
    func tryToSaveUser(name: String, email: String, mobile: String, Password: String, confirmPass: String) {
        if view.check() == true {
            let response = Validation.shared.validate(values: (type: Validation.ValidationType.alphabeticString, name),(Validation.ValidationType.email, email),(Validation.ValidationType.phoneNo, mobile),(Validation.ValidationType.password,Password))
            if confirmPass == Password{
                switch response {
                case .success:
                    sendUser(name: name, email: email, mobile: mobile, password: Password)
                    
                case .failure(_, let message):
                    print(message.localized())
                    view.showError(title: "Invalid", massage: message.localized())
                    
                }
            }
            else{
                self.view.showError(title: "Error", massage: "password and confirm password does not match")
            }
        }
        else{
            view.Empty()
        }
    }
    
    
}
