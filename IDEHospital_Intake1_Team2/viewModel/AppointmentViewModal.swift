//
//  AppointmentViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import Foundation
protocol AppointmentViewModalProtocol {
    func getUserAppointments(deletion: Bool,page: Int,completion: @escaping()-> Void)
    func getAppointment(row: Int) -> AppointmentItems
    func getAllAppointments() -> [AppointmentItems]
    func deleteAppointments(id: Int, completion: @escaping() -> Void)
    func getTotalPages()-> Int
    
    
}
class AppointmentViewModal {
    
    weak var view: HomeVCProtocol!
    var totalPages = 0
    
    var appointments = [AppointmentItems]()
    init(view: HomeVCProtocol) {
        self.view = view
    }
    
    
    
}

extension AppointmentViewModal: AppointmentViewModalProtocol {
    
    
    func getTotalPages() -> Int {
        return totalPages
    }
    
    func deleteAppointments(id: Int, completion: @escaping () -> Void) {
        
        self.view?.showLoader()
        APIManager.deleteUserAppointment(id: id) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success( _):
                self.view?.hideLoader()
                completion()
            }
        }
    }
    
    
    func getAllAppointments() -> [AppointmentItems] {
        return self.appointments
    }
    
    func getAppointment(row: Int) -> AppointmentItems {
        return self.appointments[row]
    }
    
    func getUserAppointments(deletion:Bool,page: Int,completion: @escaping()-> Void) {
        self.view.showLoader()
        APIManager.getUserAppointment(page: page) { (response) in
            switch response {
            case .failure(let err):
                print(err)
                self.view?.showAlert(title: "Sorry!", massage: "Unauthenticated Error.")
                self.view?.hideLoader()
            case .success(let result):
                self.totalPages = result.data.totalPages
                if deletion {
                    self.appointments = result.data.items
                }
                else {
                    self.appointments += result.data.items
                }
                self.view.hideLoader()
                completion()
                
            }
        }
    }
    
}
