//
//  NurseData.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/21/20.
//

import Foundation
struct NursingResponse: Codable {
    var success: Bool?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case success, code
    }
}   /// 5 d2aye2 we gaaaay

struct NurseInfo: Codable {
    var name: String
    var email: String
    var mobile: String
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case name, email,mobile,message
    }
}

struct doctorResponse: Codable {
    let code: Int!
    let success: Bool!
    let data: doctorItem!
    enum CodingKeys: String, CodingKey {
        case code, success, data
    }
}


struct doctorItem: Codable {
    let id, rating, reviewsCount: Int?
    let specialty, name, bio, secondBio: String?
    let address: String?
    let lng, lat: Double?
    let fees, waitingTime: Int?
    let image: String?
    let city: String?
    let region: String?
    let companies: [String]?
    let isFavorited: Bool?

    enum CodingKeys: String, CodingKey {
        case id, rating
        case reviewsCount = "reviews_count"
        case specialty, name, bio
        case secondBio = "second_bio"
        case address, lng, lat, fees
        case waitingTime = "waiting_time"
        case image, city, region, companies
        case isFavorited = "is_favorited"
    }
}


