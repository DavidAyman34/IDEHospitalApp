//
//  DoctorReview.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/2/21.
//

import Foundation
struct ReviewResponse: Codable {
    let data: ReviewInfo
    let code: Int
    let success: Bool
}

// MARK: - DataClass
struct ReviewInfo: Codable {
    let items: [ReviewItem]
    let total, page, perPage, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case items, total, page
        case perPage = "per_page"
        case totalPages = "total_pages"
    }
}

// MARK: - Item
struct ReviewItem: Codable {
    let id, rating: Int
    let comment, commentedBy: String

    enum CodingKeys: String, CodingKey {
        case id, rating, comment
        case commentedBy = "commented_by"
    }
}
