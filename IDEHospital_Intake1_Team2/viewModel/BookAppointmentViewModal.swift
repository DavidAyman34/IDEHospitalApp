//
//  BookAppointmentViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import Foundation

// MARK:- Protocol Methods
protocol BookAppointmentViewModalProtocol {
    func saveAppointment()
    func returnUserApp()-> userAppoint
}
class BookAppointmentViewModal {
    
    // MARK:- Properties
    weak var view: bookAppointmentVCProtocol!
    var data = userAppoint(doctor_id: 0, appointment: 0, patient_name: "", book_for_another: false, voucher: "")
    
    // MARK:- Initialization Methods
    init(view: bookAppointmentVCProtocol, data: userAppoint) {
        self.view = view
        self.data = data
    }
    
}
// MARK: - Implement Protocols
extension BookAppointmentViewModal: BookAppointmentViewModalProtocol {
    func returnUserApp() -> userAppoint {
        return data
    }
    
    func saveAppointment() {
        APIManager.userAppointment(data: data) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                if result.code == 422 {
                    self.view.showAlert(img: Asset.errorBook.image,message: L10n.failApp)
                }
                else {
                    self.view.showAlert(img: Asset.successAlert.image,message: L10n.successApp)
                }
            }
        }
    }
}
