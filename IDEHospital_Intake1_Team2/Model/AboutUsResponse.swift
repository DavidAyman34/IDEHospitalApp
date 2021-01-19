//
//  AboutUsResponse.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import Foundation
struct aboutUsResponse: Codable {
    let data: aboutInfo
    let code: Int
    let success: Bool
    enum CodingKeys: String, CodingKey {
        case data, code, success
    }
}

struct aboutInfo: Codable {
    var about_us: String
    enum CodingKeys: String, CodingKey {
        case about_us
    }
    
}


