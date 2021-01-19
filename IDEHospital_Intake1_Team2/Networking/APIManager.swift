//
//  CategoryAPIManager.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import Foundation
import Alamofire
class APIManager {
    
    // MARK:- getCategories
    class func getMainCategory(completion: @escaping (Result<MainCategoryResponse, Error>) -> Void) {
        request(APIRouter.getMainCategoy) { (response) in
            completion(response)
        }
    }
    
    
    // MARK:- getSearchResponse
    class func getSearchCategory(id: Int, completion: @escaping (Result<DoctorResponse, Error>) -> Void){
        request(APIRouter.getSearchCatrgory(id)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- getFavouritesDoctor
    class func getFavDocs(page: Int,completion: @escaping (Result<FavoriteResponse, Error>) -> Void) {
        request(APIRouter.getFavouriteDoctors(page)) { (response) in
            completion(response)
        }
    }
    // MARK:- deleteFavouritesDoctor
    class func deleteFavDocs(id: Int, completion: @escaping (Result<deleteFavourite, Error>) -> Void) {
        request(APIRouter.deleteFavouriteDoctor(id)) { (response) in
            completion(response)
        }
    }
    // MARK:- getUserAppointments
    class func getUserAppointment(page: Int,completion: @escaping (Result<AppointmentResponse, Error>) -> Void) {
        request(APIRouter.getUserAppointment(page)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- deleteUserAppointments
    class func deleteUserAppointment(id: Int, completion: @escaping (Result<deleteFavourite, Error>) -> Void) {
        request(APIRouter.deleteUserAppointment(id)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- sendNurseReqoust
    class func sendNurseReqoust(name: String, email: String, mobile: String, message: String,completion: @escaping (Result<NursingResponse, Error>) -> Void) {
        request(APIRouter.nursingRequest(name, email, mobile, message)) { (response) in
            completion(response)
        }
    }
    // MARK:- searchResult
    class func getSearchResult(mainId: Int
        ,specialtyId: Int,cityId: Int,regionId: Int,order: String, completion: @escaping (Result<ResultResponse, Error>) -> Void){
        request(APIRouter.searchResult(mainId, specialtyId, cityId, regionId,order)) { (response) in
            completion(response)
        }
    }
    class func addFavDocs(id: Int, completion: @escaping (Result<addFavourite, Error>) -> Void) {
        request(APIRouter.addFavouriteDoctor(id)) { (response) in
            completion(response)
        }
    }
    
    //MARK:- AboutUs
    class func aboutUs(completion: @escaping (Result<aboutUsResponse, Error>) -> Void){
        request(APIRouter.aboutUs) { (response) in
            completion(response)
        }
    }
    class func termCondition(completion: @escaping (Result<termResponse, Error>) -> Void){
        request(APIRouter.termConditions) { (response) in
            completion(response)
        }
    }
    // MARK:- sendNurseReqoust
    class func contactUs(name: String, email: String, mobile: String, message: String,completion: @escaping (Result<NursingResponse, Error>) -> Void) {
        request(APIRouter.nursingRequest(name, email, mobile, message)) { (response) in
            completion(response)
        }
    }
    // MARK:- SaveUser
    class func saveUser(name: String, email: String, phone: String, password: String,completion: @escaping (Result<SignUpResponse, Error>) -> Void ){
        request(APIRouter.register(name, email, phone, password)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- Login
    class func login(email: String, password: String, completion: @escaping (Result<SignUpResponse, Error>) -> Void ){
        request(APIRouter.login(email, password)) { (response) in
            completion(response)
        }
    }
    // MARK:- ResetPassword
    class func resetPass(email: String, completion: @escaping (Result<ResetResponse, Error>) -> Void ){
        request(APIRouter.resetPass(email)) { (response) in
            completion(response)
        }
    }
    // MARK:- getDoctorData
    class func getDotorData(id: Int, completion: @escaping(Result<doctorResponse, Error>) -> Void) {
        request(APIRouter.getDoctorData(id)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- getDoctorData
    class func getDotorAppointment(id: Int, completion: @escaping(Result<doctorAppointmentResponse, Error>) -> Void) {
        request(APIRouter.getdoctorAppointment(id)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- getDoctorReview
    class func getDotorReview(id: Int, completion: @escaping(Result<ReviewResponse, Error>) -> Void) {
        request(APIRouter.getDoctorReviews(id)) { (response) in
            completion(response)
        }
    }
    // MARK:- userApp
    class func userAppointment(data: userAppoint, completion: @escaping(Result<appointResponse, Error>) -> Void) {
        request(APIRouter.userAppointment(data)) { (response) in
            completion(response)
        }
    }
    // MARK:- AddComment
    class func addComment(doctorId: Int,rate: Int,comment: String, completion: @escaping (Result<commentResponse, Error>) -> Void ){
        request(APIRouter.addComment(doctorId, rate, comment)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- saveUnRegister
    class func saveUnRegister(data: bookRegister, completion: @escaping(Result<regResponse, Error>) -> Void) {
        request(APIRouter.bookRegister(data)) { (response) in
            completion(response)
        }
    }
    // MARK:- saveUnLogin
    class func saveUnLogin(data: bookLogin, completion: @escaping(Result<regResponse, Error>) -> Void) {
        request(APIRouter.bookLogin(data)) { (response) in
            completion(response)
        }
    }
    
    // MARK:- getUserData
    class func getUserData(completion: @escaping (Result<userResponse, Error>) -> Void ){
        request(APIRouter.getUserData) { (response) in
            completion(response)
        }
    }
    //MARK:- SaveUserData
    class func saveUserData(data: saveUserResponse, completion: @escaping (Result<userResponse, Error>) -> Void) {
        request(APIRouter.saveNewData(data)) { (response) in
            completion(response)
        }
    }
}




extension APIManager{
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        .responseJSON { response in
            print(response)
        }
    }
    
    
    
}
