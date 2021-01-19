//
//  NurseViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/21/20.
//

import Foundation

// MARK:- Protocol Methods
protocol NurseViewModelProtocol {
    func tryToNurseRequst(name: String, email: String, mobile: String, message: String)
    func returnContact() -> Bool
    func setNav()
}
class NurseViewModel {
    // MARK:- Properties
    weak var view: NurseVCProtocol!
    var checkContact = false
    // MARK:- Initialization Methods
    init(view: NurseVCProtocol, checkContact: Bool) {
        self.view = view
        self.checkContact = checkContact
        
        if checkContact == true {
            self.view.sendNurseView().contactLabel.isHidden = false
            self.view.sendNurseView().messgLabel.topAnchor.constraint(equalTo: self.view.sendNurseView().topAnchor, constant: 114).isActive = true
            self.view.sendNurseView().nameTextfield.topAnchor.constraint(equalTo: self.view.sendNurseView().contactLabel.topAnchor, constant: 48).isActive = true
        }
        else {
            self.view.sendNurseView().contactLabel.isHidden = true
        }
    }
    
    
    
    // MARK:- Private Methods
    private func sendRequst(name: String, email: String, mobile: String, message: String){
        self.view!.showLoader()
        if checkContact == true {
            APIManager.contactUs(name: name, email: email, mobile: mobile , message: message) { (response) in
                switch response {
                case .failure(let error):
                    print(error)
                case .success(let result):
                    print(result)
                    self.view!.successAlert(massage: "Your Request Sent Successfully.")
                    
                }
                self.view!.hideLoader()
            }
        }
        else {
            APIManager.sendNurseReqoust(name: name, email: email, mobile: mobile , message: message) { (response) in
                switch response {
                case .failure(let error):
                    print(error)
                case .success(let result):
                    print(result)
                    self.view!.successAlert(massage: "Your Request Sent Successfully.")
                }
                self.view!.hideLoader()
            }
        }
    }
    
    
}
// MARK: - Implement Protocols
extension NurseViewModel : NurseViewModelProtocol {
    func setNav() {
        if checkContact == true {
            self.view.setContactNav()
        }
        else {
            self.view.setNurseNav()
        }
    }
    
    
    func returnContact() -> Bool {
        return checkContact
    }
    func tryToNurseRequst(name: String, email: String, mobile: String, message: String) {
        
        let response = Validation.shared.validate(values: (type: Validation.ValidationType.alphabeticString, name),(Validation.ValidationType.email, email),(Validation.ValidationType.phoneNo, mobile),(Validation.ValidationType.alphabeticString,message))
        switch response {
        case .success:
            sendRequst(name: name, email: email, mobile: mobile, message: message)
            
        case .failure(_, let message):
            print(message.localized())
            view.showAlert(img: Asset.errorBook.image, massage: message.localized())
            
        }
        
        
    }
    
    
}
