//
//  ApiRouter.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//


import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    // The endpoint name
    
    case getMainCategoy
    case getSearchCatrgory(_ id: Int)
    case getFavouriteDoctors(_ page: Int)
    case deleteFavouriteDoctor(_ id: Int)
    case getUserAppointment(_ page: Int)
    case deleteUserAppointment(_ id: Int)
    
    case searchResult(_ mainId: Int,_ specialtyId: Int,_ cityId: Int,_ regionId: Int,_ orderBy: String)
    case nursingRequest(_ name: String,_ email: String,_ mobile: String,_ message: String)
    case addFavouriteDoctor(_ id: Int)
    
    case aboutUs
    case termConditions
    case contactUs(_ name: String,_ email: String,_ mobile: String,_ message: String)
    case register(_ name: String,_ email: String,_ phone: String,_ password: String)
    case login(_ email: String,_ password: String)
    case resetPass(_ email: String)
    
    case getDoctorData(_ doctor_id:Int)
    case getdoctorAppointment(_ doctor_id:Int)
    case getDoctorReviews(_ doctor_id: Int)
    case userAppointment(_ data: userAppoint)
    case addComment(_ doctorId: Int,_ rate: Int,_ comment: String)
    case bookRegister(_ data: bookRegister)
    case bookLogin(_ data: bookLogin)
    
    case getUserData
    case saveNewData(_ data: saveUserResponse)
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
        case .getMainCategoy, .getSearchCatrgory, .getFavouriteDoctors, .getUserAppointment, .searchResult, .aboutUs, .termConditions, .getDoctorData, .getdoctorAppointment, .getDoctorReviews, .getUserData:
            return .get
        case .deleteFavouriteDoctor, .addFavouriteDoctor, .nursingRequest, .contactUs, .register, .login, .resetPass, .userAppointment, .addComment, .bookRegister, .bookLogin:
            return .post
        case .deleteUserAppointment:
            return .delete
        case .saveNewData:
            return .patch
            
        }
    }
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getUserAppointment(let page):
            return [ParameterKeys.page: page]
        case .getFavouriteDoctors(let page):
            return [ParameterKeys.page: page]
        case .nursingRequest(let name, let email, let mobile, let message):
            return [ParameterKeys.email: email, ParameterKeys.name: name,
                    ParameterKeys.message: message, ParameterKeys.mobile: mobile]
        case .searchResult(let mainId, let specialtyId,let cityId,let regionId, let order):
            
            if cityId != 0 && regionId != 0 && specialtyId != 0{
                return [ParameterKeys.main_category_id: mainId,ParameterKeys.specialty_id: specialtyId  , ParameterKeys.city_id: cityId,
                        ParameterKeys.region_id: regionId, ParameterKeys.order_by: order]
            }
                
            else{
                
                if cityId != 0 && specialtyId != 0{
                    return [ParameterKeys.main_category_id: mainId,ParameterKeys.specialty_id: specialtyId  , ParameterKeys.city_id: cityId, ParameterKeys.order_by: order]
                }
                else if cityId == 0 && specialtyId != 0 {
                    return [ParameterKeys.main_category_id: mainId,ParameterKeys.specialty_id: specialtyId, ParameterKeys.order_by: order]
                }
                else if cityId != 0 && specialtyId == 0 {
                    return [ParameterKeys.main_category_id: mainId,ParameterKeys.city_id: cityId, ParameterKeys.order_by: order]
                }
                else {
                    return [ParameterKeys.main_category_id: mainId, ParameterKeys.order_by: order]
                }
            }
            
            
        case .contactUs(let name, let email, let mobile, let message):
            return [ParameterKeys.email: email, ParameterKeys.name: name,
                    ParameterKeys.message: message, ParameterKeys.mobile: mobile]
            
        case .register(let name, let email, let mobile, let pass):
            return [ParameterKeys.email: email, ParameterKeys.name: name, ParameterKeys.mobile: mobile, ParameterKeys.pass : pass]
        case .login(let email, let pass):
            return [ParameterKeys.email: email, ParameterKeys.pass : pass]
            
        case .resetPass(let email):
            return [ParameterKeys.email: email]
        case .userAppointment(let data):
            return [ParameterKeys.doctor_id: data.doctor_id ?? 0, ParameterKeys.appointment: data.appointment ?? 0, ParameterKeys.pName: data.patient_name ?? "", ParameterKeys.bookAnother: data.book_for_another ?? false, ParameterKeys.voucher: data.voucher ?? ""]
            
        case . addComment(let docId, let rate, let comment):
            return [ParameterKeys.doctor_id: docId, ParameterKeys.rating: rate, ParameterKeys.comment: comment]
        case .bookRegister(let data):
            return [ParameterKeys.email: data.email!, ParameterKeys.name: data.name!, ParameterKeys.mobile: data.mobile!, ParameterKeys.pass: data.password!, "doctor_id": data.doctor_id!, "appointment": data.appointment!, "patient_name": data.patient_name ?? "", "book_for_another": data.book_for_another ?? false, "voucher": data.voucher ?? ""]
        case .bookLogin(let data):
            return [ParameterKeys.email: data.email!, ParameterKeys.pass: data.password!, "doctor_id": data.doctor_id!, "appointment": data.appointment!, "patient_name": data.patient_name ?? "", "book_for_another": data.book_for_another ?? false, "voucher": data.voucher ?? ""]
        case .saveNewData(let data):
            return [ParameterKeys.name: data.name ?? "", ParameterKeys.email: data.email ?? "", ParameterKeys.mobile: data.mobile ?? "", ParameterKeys.pass: data.password ?? "" , ParameterKeys.oldPass: data.old_password ?? ""]
        default:
            return nil
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        case .getMainCategoy:
            return URLs.mainCategories
        case .getSearchCatrgory(let id):
            return "\(URLs.mainCategories)/\(id)/doctors_query_parameters"
        case .getFavouriteDoctors:
            return URLs.getDoctors
        case .deleteFavouriteDoctor(let id):
            return "\(URLs.deleteDoctor)/\(id)/add_remove"
        case .getUserAppointment:
            return URLs.userAppointments
        case .deleteUserAppointment(let id):
            return "\(URLs.userAppointments)/\(id)"
            
        case .nursingRequest:
            return URLs.nursing
        case .searchResult(let mainId,_ ,_,_,_):
            return "\(URLs.mainCategories)/\(mainId)/doctors"
        case .addFavouriteDoctor(let id):
            return "\(URLs.addDoctor)/\(id)/add_remove"
        case .aboutUs:
            return URLs.aboutUs
        case .termConditions:
            return URLs.termConditions
        case .contactUs:
            return URLs.contactUs
        case .register(_, _, _, _):
            return URLs.saveUser
        case .login(_,_):
            return URLs.login
        case .resetPass(_):
            return URLs.resetPass
        case .getDoctorData(let id):
            return "\(URLs.doctors)/\(id)"
        case .getdoctorAppointment(let id):
            return "\(URLs.doctors)/\(id)/appointments"
        case .getDoctorReviews(let id):
            return "\(URLs.doctors)/\(id)/reviews"
        case .userAppointment:
            return URLs.saveAppoinment
        case.addComment(let docId, _, _):
            return "\(URLs.addComment)/\(docId)/reviews"
        case .bookRegister:
            return "\(URLs.userAppointments)/\(URLs.withRegister)"
        case .bookLogin:
            return "\(URLs.userAppointments)/\(URLs.with_login)"
        case .getUserData:
            return URLs.user
        case .saveNewData:
            return URLs.user
        }
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getMainCategoy, .aboutUs, .termConditions, .getDoctorData, .getdoctorAppointment:
            urlRequest.setValue("Accept-Language", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        case .getSearchCatrgory:
            urlRequest.setValue("Accept-Language", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        case .getFavouriteDoctors, .getUserAppointment, .searchResult:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().token ?? "")",
                forHTTPHeaderField: HeaderKeys.Authorization)
            urlRequest.setValue("Accept-Language", forHTTPHeaderField: HeaderKeys.acceptLanguage)
        case .deleteFavouriteDoctor, .deleteUserAppointment, .userAppointment, .addComment,.getUserData, .saveNewData:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().token ?? "")",
                forHTTPHeaderField: HeaderKeys.Authorization)

        case .addFavouriteDoctor:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().token ?? "")",
                forHTTPHeaderField: HeaderKeys.Authorization)
        default:
            break
        }
        
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
