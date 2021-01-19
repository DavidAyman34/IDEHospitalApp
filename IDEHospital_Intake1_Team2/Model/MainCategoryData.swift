//
//  catData.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import Foundation
struct MainCategoryResponse: Codable {
    var success: Bool?
    var data: [MainCategory]?
    
    enum CodingKeys: String, CodingKey {
        case success, data
    }
}

struct MainCategory: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var color: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, color
    }
}
