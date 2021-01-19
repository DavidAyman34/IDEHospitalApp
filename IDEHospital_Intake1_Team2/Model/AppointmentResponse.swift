//
//  AppointmentResponse.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import Foundation
struct AppointmentResponse: Codable {
    let data: AppointmentInfo
    let code: Int
    let success: Bool
}

// MARK: - DataClass
struct AppointmentInfo: Codable {
    let items: [AppointmentItems]
    let total, page: Int
       let perPage: Int
       let totalPages: Int

       enum CodingKeys: String, CodingKey {
           case items, total, page
           case perPage = "per_page"
           case totalPages = "total_pages"
       }
}

// MARK: - Item
struct AppointmentItems: Codable {
    let id, appointment: Int
    let patientName: String
    let bookForAnother: Bool
    let doctor: Doctor
    let voucher: Bool

    enum CodingKeys: String, CodingKey {
        case id, appointment
        case patientName = "patient_name"
        case bookForAnother = "book_for_another"
        case doctor, voucher
    }
}

// MARK: - Doctor
struct Doctor: Codable {
    let id, rating, reviewsCount: Int
    let specialty, name, bio, secondBio: String
    let address: String
    let lng, lat: Double?
    let fees, waitingTime: Int
    let image: String
    let city: String
    let region: String
    let companies: [String]
    let isFavorited: Bool

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

