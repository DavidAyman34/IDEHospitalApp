//
//  ResetPassViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import Foundation

// MARK:- Protocol Methods
protocol ResetPassViewModelProtocol {
    func forgetPass(email: String)
    
}
class ResetPassViewModel{
    
    // MARK:- Properties
    weak var view: ResetPasswordProtocol!
    
    // MARK:- Initialization Methods
    init(view: ResetPasswordProtocol) {
        self.view = view
    }
    
    // MARK:- Private Methods
    private func resetPass(email: String){
        view.showLoader()
        APIManager.resetPass(email: email) { (respone) in
            switch respone{
            case .failure(let error):
                print(error)
            case .success(let result):
                print(result)
                self.view.showAlert(title: "Succeed", massage: "your password send code via sms")
                
                
            }
            self.view.hideLoader()
        }
    }
}

// MARK: - Implement Protocols
extension ResetPassViewModel: ResetPassViewModelProtocol{
    func forgetPass(email: String) {
        if view.check() == true{
            resetPass(email: email)
        }
        else{
            view.showAlert(title: "Email", massage: "Please write your email")
        }
    }
    
    
    
}

