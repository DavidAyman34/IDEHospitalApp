//
//  VoucherViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import Foundation

// MARK:- Protocol Methods
protocol VoucherViewModalProtocol {
    func continuePressed()
    //    func setUserAppointment()-> userAppoint
    
}
class VoucherViewModal {
    
    // MARK:- Properties
    weak var view: VoucherVCProtocol!
    var v = ""
    var id: Int
    var appoint: Int
    var userApp = userAppoint(doctor_id: 0, appointment: 0, patient_name: "", book_for_another: false, voucher: "")
    
    // MARK:- Initialization Methods
    init(view: VoucherVCProtocol, id: Int, appoint: Int) {
        self.view = view
        self.id = id
        self.appoint = appoint
    }
    
}

// MARK: - Implement Protocols
extension VoucherViewModal: VoucherViewModalProtocol {
    func continuePressed() {
        
        if self.view.sendIsOnCode() == true && self.view.sendCode() == "" {
            self.view.showAlert(img: Asset.errorBook.image, massage: L10n.voucherAlert)
        }
        else if self.view.sendIsOnName() == true && self.view.sendName() == "" {
            self.view.showAlert(img: Asset.errorBook.image, massage: L10n.personAlert)
        }
        else {
            var code = self.view.sendCode()
            if code.isEmpty {
                code = "283593"
            }
            userApp = userAppoint(doctor_id: id, appointment: appoint, patient_name: self.view.sendName(), book_for_another: self.view.sendIsOnName(), voucher: code)
            self.view.switchToBook(userApp: userApp)
        }
    }
    
}
