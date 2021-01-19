//
//  SearchViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/10/20.
//

import Foundation
import Alamofire
// MARK:- Protocol Methods
protocol SearchViewModelProtocols{
    func sendCategoriesData() -> DoctorInfo
    func getData(completion: @escaping() -> Void)
    func getCityId(id: Int)
    func sendCityId() -> Int
    func sendMainId() -> Int
    func findDoctor()
}

class SearchViewModel {
    
    // MARK:- Properties
    private var cityId = 0
    var setCategories = DoctorInfo()
    private var id = 0
    weak var view: SearchVCProtocol?
    
    // MARK:- Initialization Methods
    init(view: SearchVCProtocol, id: Int) {
        self.view = view
        self.id = id
    }
    
    
}
// MARK: - Implement Protocols
extension SearchViewModel: SearchViewModelProtocols{
    
    func sendMainId() -> Int {
        return id
    }
    func sendCityId() -> Int {
        return cityId
    }
    
    func getCityId(id: Int) {
        cityId = id
    }
    
    func sendCategoriesData() -> DoctorInfo {
        return setCategories
    }
    
    func getData(completion: @escaping () -> Void) {
        view?.showLoader()
        APIManager.getSearchCategory(id: self.id) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                print(result.success ?? "s")
                self.setCategories = result.data!
                self.view?.hideLoader()
                completion()
            }
        }
        
    }
    
    func findDoctor(){
        self.view?.goToResult()
        //        if view?.check() == true{
        //
        //        }
        //        else{
        //            self.view?.Empty()
        //        }
    }
    
    
    
}
