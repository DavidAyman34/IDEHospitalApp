//
//  File.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/10/20.
//

import Foundation

struct DoctorResponse: Codable{
    
    var success: Bool?
    var code: Int?
    var data: DoctorInfo?
    
         
    enum CodingKeys: String, CodingKey {
        case success, code, data
    }
}

struct DoctorInfo: Codable{
    var specialties: [Speciality]?
    var cities: [City]?
    var companies: [Company]?
    
    enum CodingKeys: String, CodingKey {
        case specialties, cities, companies
    }
}

struct Speciality: Codable{
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}

struct City: Codable {
    var id: Int?
    var name: String?
    var regions: [Region]?
    enum CodingKeys: String, CodingKey {
        case id, name, regions
    }
}

struct Region: Codable {
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}


struct Company: Codable {
    var id: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}

