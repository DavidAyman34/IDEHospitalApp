//
//  Register.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import Foundation
struct SignUpResponse: Codable {
    
    
    let data: UserData?
    var success: Bool?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case success, code
    }
    
}

struct UserData: Codable {
    var id: Int
    var name, email: String
    var mobile: String
    let token: String
    enum CodingKeys: String, CodingKey {
        case name, email, mobile, id
        case token = "access_token"
    }
}

struct ResetResponse: Codable {
    var success: Bool?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case success, code
    }
    
}


struct bookRegister: Codable {
    
    var name, email: String!
    var password: String!
    var mobile: String!
    var doctor_id: Int!
    var appointment: String!
    var patient_name: String?
    var book_for_another: Bool?
    var voucher: String?
    enum CodingKeys: String, CodingKey {
        case name, email, mobile
        case doctor_id , appointment, patient_name,  book_for_another, voucher
    }
}

struct bookLogin: Codable {
    
    var email: String!
    var password: String!
    var doctor_id: Int!
    var appointment: String!
    var patient_name: String?
    var book_for_another: Bool?
    var voucher: String?
    enum CodingKeys: String, CodingKey {
        case email
        case doctor_id , appointment, patient_name,  book_for_another, voucher
    }
}

struct regResponse: Codable {
    var success: Bool?
    var code: Int?
    var data: regInfo?
    enum CodingKeys: String, CodingKey {
        case success, code, data
    }
    
}
struct regInfo: Codable {
    var access_token: String
    enum CodingKeys: String, CodingKey {
        case access_token
    }
}
