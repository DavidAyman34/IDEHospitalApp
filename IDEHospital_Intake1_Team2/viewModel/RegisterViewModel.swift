//
//  RegisterViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 1/13/21.
//

import Foundation

// MARK:- Protocol Methods
protocol  RegisterViewModelProtocol {
    func tryToSaveUser(name: String, email: String, mobile: String, Password: String, patientName: String, book_for_another: Bool, voucher: String)
    func tryTologin(email: String, Password: String, patientName: String, book_for_another: Bool, voucher: String)
}
class  RegisterViewModel{
    // MARK:- Properties
    weak var view: RegisterProtocol!   
    var id = 0
    var appoint = ""
    var book = bookRegister()
    var loginBook = bookLogin()
    // MARK:- Initialization Methods
    init(view: RegisterProtocol, id: Int, appoint: Int) {
        self.view = view
        self.id = id
        self.appoint = String(appoint)
    }
    
    // MARK:- Private Methods
    
    func valid(name: String?, email:String?, mobile: String? ,Password: String?) -> Bool {
        let response = Validation.shared.validate(values: (type: Validation.ValidationType.alphabeticString, name!),(Validation.ValidationType.email, email!),(Validation.ValidationType.phoneNo, mobile!),(Validation.ValidationType.password, Password!))
        switch response {
        case .success:
            return true
            
        case .failure(_, let message):
            print(message.localized())
            view.showError(title: "", massage: message.localized())
            return false
            
        }
    }
    
    func validLogin(email: String?, password:String?) -> Bool {
        let response = Validation.shared.validate(values: (type: Validation.ValidationType.email, email!),(Validation.ValidationType.password, password!))
        switch response {
        case .success:
            return true
            
        case .failure(_, let message):
            print(message.localized())
            view.showError(title: "", massage: message.localized())
            return false
            
        }
    }
    
    
    private func sendUser(data: bookRegister){
        self.view!.showLoader()
        APIManager.saveUnRegister(data: data) { (respone) in
            switch respone {
            case .failure(let error):
                print(error)
                
            case .success(let result):
                print(result)
                if result.code == 422 {
                    self.view.showError(title: "Error", massage: L10n.failApp)
                }
                else {
                    self.view!.showAlert(title: "Succeed", massage: L10n.successApp)
                    UserDefaultsManager.shared().token = result.data?.access_token
                }
            }
        }
        self.view!.hideLoader()
    }
    
    private func login(data: bookLogin) {
        APIManager.saveUnLogin(data: data) { (respone) in
            switch respone{
            case .failure(let error):
                print(error)
            case .success(let result):
                if result.code == 401 {
                    self.view.showError(title: "Error", massage: "email or password is inncorrect.")
                }
                else {
                    self.view!.showAlert(title: "Succeed", massage: L10n.successApp)
                    UserDefaultsManager.shared().token = result.data?.access_token
                    print(result)
                }
            }
        }
    }
    
    
}

// MARK: - Implement Protocols
extension RegisterViewModel: RegisterViewModelProtocol{
    func tryToSaveUser(name: String, email: String, mobile: String, Password: String, patientName: String, book_for_another: Bool, voucher: String) {
        if valid(name: name, email: email, mobile: mobile, Password: Password) {
            var vouch = voucher
            if vouch.isEmpty {
                vouch = "283593"
            }
            book = bookRegister(name: name, email: email, password: Password, mobile: mobile, doctor_id: id, appointment: appoint, patient_name: patientName, book_for_another: book_for_another, voucher: vouch)
            sendUser(data: book)
        }
        
    }
    func tryTologin(email: String, Password: String, patientName: String, book_for_another: Bool, voucher: String) {
        
        if validLogin(email: email, password: Password) {
            var vouch = voucher
            if vouch.isEmpty {
                vouch = "283593"
            }
            loginBook = bookLogin(email: email, password: Password, doctor_id: id, appointment: appoint, patient_name: patientName, book_for_another: book_for_another, voucher: vouch)
            login(data: loginBook)
        }
    }
}
