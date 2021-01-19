//
//  SignInViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import Foundation

// MARK:- Protocol Methods
protocol SignInViewModelProtocol {
    func tryTologin(email: String, Password: String)
    
}
class SignInViewModel{
    
    // MARK:- Properties
    weak var view: SignInProtocol!
    
    // MARK:- Initialization Methods
    init(view: SignInProtocol) {
        self.view = view
    }
    
    // MARK:- Private Methods
    private func login(email: String, Password: String){
        APIManager.login(email: email, password: Password) { (respone) in
            switch respone{
            case .failure(let error):
                print(error)
            case .success(let result):
                if result.code == 401 {
                    self.view.showError(title: "Error", massage: "email or password is inncorrect.")
                }
                else{
                    self.view!.showAlert(title: "Succeed", massage: "Login successful")
                    UserDefaultsManager.shared().token = result.data?.token
                    print(result)
                }
                
                
                
            }
        }
        
        
    }
}

// MARK: - Implement Protocols
extension SignInViewModel: SignInViewModelProtocol{
    func tryTologin(email: String, Password: String) {
        if view.check() == true{
            let response = Validation.shared.validate(values: (Validation.ValidationType.email, email),(Validation.ValidationType.password,Password))
            switch response {
            case .success:
                login(email: email, Password: Password)
                
            case .failure(_, let message):
                print(message.localized())
                view.showError(title: "Invalid", massage: message.localized())
                
            }
        }
        else {
            view.Empty()
        }
    }
    
    
    
    
    
}
