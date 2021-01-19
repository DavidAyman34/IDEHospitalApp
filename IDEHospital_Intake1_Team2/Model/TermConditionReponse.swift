//
//  TermConditionReponse.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import Foundation
struct termResponse: Codable {
    let data: termInfo
    let code: Int
    let success: Bool
    enum CodingKeys: String, CodingKey {
        case data, code, success
    }
}

struct termInfo: Codable {
    var terms_and_conditions: String
    enum CodingKeys: String, CodingKey {
        case terms_and_conditions
    }
    
}
