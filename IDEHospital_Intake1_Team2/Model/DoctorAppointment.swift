//
//  DoctorAppointment.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/2/21.
//

import Foundation
struct doctorAppointmentResponse: Codable {
    let data: [docAppInfo]
    let code: Int
    let success: Bool
    enum CodingKeys: String, CodingKey {
        case data, code, success
    }
}

struct docAppInfo: Codable {
    
    var date: Int
    var times: [appointmentDetail]
    enum CodingKeys: String, CodingKey {
        case date, times
    }
    
}
struct appointmentDetail: Codable {
    
    var booked: Bool
    var time: Int
    enum CodingKeys: String, CodingKey {
        case booked, time
    }
    
}


