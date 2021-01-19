//
//  userAppointment.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import Foundation
import UIKit
struct userAppoint: Codable {
    var doctor_id: Int?
    var appointment: Int?
    var patient_name: String?
    var book_for_another: Bool?
    var voucher: String?
    
    enum CodingKeys: String, CodingKey {
        case doctor_id, appointment, patient_name
        case book_for_another
        case voucher
    }
}
struct appointResponse: Codable {
    let code: Int?
    let success: Bool?
    enum CodingKeys: String, CodingKey {
        case code, success
    }
}
struct ErrorResponse: Error {
    let code: Int
    let errors: Errors
    enum CodingKeys: String, CodingKey {
        case code, errors
    }
}

// MARK: - Errors
struct Errors: Codable {
    let voucher: [String]
    enum CodingKeys: String, CodingKey {
        case voucher
    }
}
struct commentResponse: Codable {
    let errors: String?
    let message: String?
    let code: Int?
    enum CodingKeys: String, CodingKey {
        case errors, code, message
    }
}
class Utils {
    
    static func showAlert(payload: AlertPayload, parentViewController: UIViewController) {
        let customAlertController = SuccessBookVC.create()
        customAlertController.payload = payload
       // customAlertController.modalPresentationStyle = .overCurrentContext
        parentViewController.present(customAlertController, animated: true, completion: nil)
    }
    
   static func showAlert1(payload: AlertPayload1, parentViewController: UIViewController) {
        let customAlertController = cancelAppointmentVC.create()
       
        customAlertController.payload = payload;
        
        parentViewController.present(customAlertController, animated: true, completion: nil)
    }
}

