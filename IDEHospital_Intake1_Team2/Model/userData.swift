//
//  userData.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/9/21.
//

import Foundation
struct userResponse: Codable {
    let success: Bool?
    let data: userInfo?
    let code: Int
    
}

// MARK: - DataClass
struct userInfo: Codable {
    let email, name, mobile, accessToken: String?

    enum CodingKeys: String, CodingKey {
        case email, name, mobile
        case accessToken = "access_token"
    }
}

struct saveUserResponse: Codable {
    let name: String!
    let email: String!
    let mobile: String!
    let password: String?
    let old_password: String?
    
    enum CodingKeys: String, CodingKey {
        case name, email, mobile
        case password, old_password
    }
    
}
