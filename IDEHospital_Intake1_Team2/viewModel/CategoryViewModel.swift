//
//  CategoryViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import Foundation
import Alamofire
protocol CategoryViewModelProtocol {
    func readMainCategory(completion: @escaping() -> Void)
    func sendMainCategory() -> [MainCategory]
}
class CategoryViewModel {
    
    
    var setCategories = [MainCategory]()
    weak var view: HomeVCProtocol?
    init(view: HomeVCProtocol) {
        self.view = view
    }
    
    
    
}

extension CategoryViewModel: CategoryViewModelProtocol {
    
    // MARK:- readCategories
    func readMainCategory(completion: @escaping() -> Void) {
        self.view?.showLoader()
        APIManager.getMainCategory { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let result):
                self.setCategories = result.data!
                self.view?.hideLoader()
                completion()
            }
        }
    }
    // MARK:- sendCategories
    func sendMainCategory() -> [MainCategory] {
        return self.setCategories
    }
    
    
}

