//
//  Constants.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import Foundation
struct URLs {
    static let base = "http://ide-hospital.ideaeg.co/api/"
    static let mainCategories = "main_categories"
    static let getDoctors = "favorites/doctors"
    static let deleteDoctor = "favorites/doctors"
    static let userAppointments = "user_appointments"
    static let nursing = "nursing_requests"
    static let addDoctor = "favorites/doctors"
    static let aboutUs = "about_us"
    static let termConditions = "terms_and_conditions"
    static let contactUs = "contact_us_requests"
    static let saveUser = "register"
    static let login = "login"
    static let resetPass = "forget_password"
    static let doctors = "doctors"
    static let saveAppoinment = "user_appointments"
    static let addComment = "doctors"
    static let user = "user"
    static let withRegister = "with_register"
    static let with_login = "with_login"
}
struct HeaderKeys {
    static let acceptLanguage = "en"
    static let Authorization = "Authorization"
    //static let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWE4OTQ3YTEwMTM0ODIyM2ZjZDYyYzg0OGFkZDdlMmZmYzhiMzllZDAwMjdiODU4MzE3M2RiMjA2YmM0MmYzMjUyMjQzYmNkNjQ2YzUwZmYiLCJpYXQiOjE2MDQ0OTMzNDMsIm5iZiI6MTYwNDQ5MzM0MywiZXhwIjoxNjM2MDI5MzQzLCJzdWIiOiI0NSIsInNjb3BlcyI6W119.iYhEyw4yRfd5UNhmzR9F2xzhIYZktHEKT_vKXaaiBgEGx1bQ-oyiEq0nC5dYrJGCirPK86J4MNg-yHidl1wpLEeRUE-YROerT5irXwJkEP9dWVsosIItvMdG0msv4w7G4m3wZVSpaVaaJk2y-6KqZ1BphmuDieNqx4xQqHW1Y8NAu3Dh09lMX6xzMKZwu8kB_MEzv7G10b8n5VwktV31eu8MrBDJhZmwriP2MVM8NVKIgbCdAq3o-xThbqmG479ViS1O3ijJ047ZjkkduZsQuh92NHhrkj2wj5UBpjlYEjLlcKwFvFJcQFA5A0B_ackIJLQktDfw9DGFLLOGEzoi2nVj8tINCG9TbI4-5Y-G8h8kMJCzxybNl1UA-LsMoonM3rY3smQdentBVyM53FYkAbgy9yqAl7Od6A-3D2baEZncCHHq2sZe8eUdS_X07qrOEj1Ip-pc5kLwzwD6vM5y8ptFG_sWmszJo1rNOV6ZoacKD0p_KZU21c9DPjei4VP5Y6y_tilEDxLKfK3wCD_80fmhKjAR5BVpRqHmlWnA1laGx0hGxthXHeg6-5URONR4h0Yiw-ZhzxehIrRmG6vDsofg9jeqSbO4WnTTysCd21xhK1gEvj67DgwwY4Tq_iaZDgRQvKzjRDJpGMysFOS6f4MfbQDAwms7X3EyxmfJk_I"
}
// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "UDKToken"
    static let docID = "docID"
}
struct ParameterKeys {
    static let email = "email"
    static let mobile = "mobile"
    static let name = "name"
    static let message = "message"
    static let main_category_id = "main_category_id"
    static let page = "page"
    static let per_page = "per_page"
    static let specialty_id = "specialty_id"
    static let city_id = "city_id"
    static let region_id = "region_id"
    static let order_by = "order_by"
    static let pass = "password"
    static let oldPass = "old_password"
    static let doctor_id = "doctor_id"
    static let appointment = "appointment"
    static let pName = "patient_name"
    static let bookAnother = "book_for_another"
    static let voucher = "voucher"
    static let comment = "comment"
    static let rating = "rating"
    
}

// Storyboards
struct Storyboards {
    static let main = "Main"
    static let Search = "Search"
    static let Favourite = "Favourite"
    static let Appointment = "Appointment"
    static let searchResult = "SearchResult"
    static let nurse = "Nurse"
    static let AboutUs = "AboutUs"
    static let Setting = "Setting"
    static let auth = "Auth"
    static let bookDoctor = "bookDoctor"
    static let voucher  = "Voucher"
    static let bookAppointment = "bookAppointment"
    static let CancelAppointment = "CancelAppointment"
    static let SuccessBook = "SuccessBook"
    static let addComment = "AddComment"
    static let EditProfile = "EditProfile"
   
    static let register = "PopAuth"
}

// View Controllers
struct ViewControllers {
    static let homeVC = "HomeVC"
    static let searchVC = "SearchVC"
    static let FavouriteVC = "FavouriteVC"
    static let AppointmentVC = "AppointmentVC"
    static let nurseVC = "NurseVC"
    static let searchResultVC = "SearchResultVC"
    static let AboutUsVC = "AboutUsVC"
    static let SettingVC = "SettingVC"
    static let signUpVc = "SignUpVC"
    static let signInVC = "SignInVC"
    static let resetPasswordVC = "ResetPasswordVC"
    static let DoctorProfileVC = "DoctorProfileVC"
    static let VoucherVC = "VoucherVC"
    static let bookAppointmentVC = "bookAppointmentVC"
    static let cancelAppointmentVC = "cancelAppointmentVC"
    static let SuccessBookVC = "SuccessBookVC"
    static let addCommentVC = "AddCommentVC"
    static let EditProfileVC = "EditProfileVC"
    static let registerVC = "RegisterVC"
}
struct Cells {
    static let resultCell = "ResultCell"
    
}

