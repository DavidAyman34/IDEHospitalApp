//
//  DoctorProfileViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/1/21.
//

import Foundation
protocol DoctorProfileViewModalProtocol:class {
    func getDoctorData(completion: @escaping() -> Void)
    func fetchDoctor()-> doctorResponse
    func getDocApp(completion: @escaping() -> Void)
    func returnDocAppointment() -> [String]
    func returnDetailsAppoints() -> [[String]]
    func fetchDocReview(completion: @escaping() -> Void)
    func returnReviews()-> [ReviewItem]
    func returnAllAppointment()->[[Int]]
    func returnAllBookApp()-> [[Bool]]
    func addfav(id: Int)
    func setBook()
    func setFav()
}
class DoctorProfileViewModal {
    
    weak var view: docVCProtocol!
    var doctorData = doctorResponse(code: 200, success: true, data: nil)
    var id: Int = 0
    var docAppoint = [docAppInfo]()
    var dateArray = [String]()
    var dayArray = [String]()
    var allDayArray = [[String]]()
    var items = [ReviewItem]()
    var allArray = [[Int]]()
    var partArray = [Int]()
    var allBook = [[Bool]]()
    var bookArray = [Bool]()
    var allDateArray = [[String]]()
    init(view: docVCProtocol, id: Int) {
        self.view = view
        self.id = id
    }
    func convertDate(time: Int) -> [String]{
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = L10n.date
        let strDate = dateFormatter.string(from: date)
        let array = strDate.components(separatedBy: CharacterSet(charactersIn: "/"))
        return array
    }
    
}
extension DoctorProfileViewModal: DoctorProfileViewModalProtocol {
    func setFav() {
        if UserDefaultsManager.shared().token == nil {
            self.view.noFav()
        }
        else {
            self.view.fav()
//            sender.setImage(nil, for: .normal)
//            sender.setImage(Asset.heart2.image, for: .normal)
            
        }
    }
    
    func setBook() {
        if UserDefaultsManager.shared().token == nil {
            self.view.switchUnRegister()
        }
        else {
            self.view.switchVoucher()
        }
    }
    
    
    func addfav(id: Int) {
        self.view.showLoader()
        APIManager.addFavDocs(id: id) { (response) in
            switch response{
            case .failure(let error):
                print(error)
            case .success(let result):
                print(result)
                
                
                // self.view.returnTableView()
            }
            self.view.hideLoader()
        }
    }
    
    func returnAllBookApp()-> [[Bool]] {
        for i in docAppoint {
            for j in i.times {
                bookArray.append(j.booked)
            }
            allBook.append(bookArray)
            bookArray = [Bool]()
        }
        return allBook
    }
    
    func returnAllAppointment() -> [[Int]] {
        for i in docAppoint {
            for j in i.times {
                partArray.append(j.time)
            }
            allArray.append(partArray)
            partArray = [Int]()
        }
        return allArray
    }
    
    
    func returnReviews() -> [ReviewItem] {
        return items
    }
    
    func fetchDocReview(completion: @escaping() -> Void) {
        self.view.showLoader()
        APIManager.getDotorReview(id: id) {  (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                self.items = result.data.items
                self.view.hideLoader()
                completion()
            }
        }
    }
    
    func returnDetailsAppoints() -> [[String]] {
        return allDayArray
    }
    
    func returnDocAppointment() -> [String] {
        allDayArray = [[String]]()
        dateArray = [String]()
        for i in docAppoint {
            self.dateArray.append(convertDate(time: i.date)[0])
            for j in i.times {
                dayArray.append(convertDate(time: j.time)[1])
            }
            allDayArray.append(dayArray)
            dayArray = [String]()
            
        }
        return self.dateArray
    }
    
    func getDocApp(completion: @escaping() -> Void) {
        self.view.showLoader()
        APIManager.getDotorAppointment(id: id) {  (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                print("$$$")
                print(result)
                self.docAppoint = result.data
                self.view.hideLoader()
                completion()
            }
        }
    }
    
    func fetchDoctor() -> doctorResponse {
        return doctorData
    }
    
    func getDoctorData(completion: @escaping() -> Void) {
        self.view.showLoader()
        APIManager.getDotorData(id: id) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                self.view.hideLoader()
                self.doctorData = result
                completion()
            }
        }
    }
}
