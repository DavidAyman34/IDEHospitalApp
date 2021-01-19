//
//  FavouriteViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import Foundation
protocol getFavDoctors {
    func getDocsResponse(deletion: Bool,page: Int,completion: @escaping() -> Void)
    func sendDoctorData(row: Int) -> FavoriteItem
    func getAllFavDoctors() -> [FavoriteItem]
    func deleteFavDocs(id: Int, completion: @escaping() -> Void)
    func getTotalPages()-> Int
}

class FavouriteViewModal {
    var totalPages = 0
    var favoriteItems = [FavoriteItem]()
    weak var view: FavouriteVCProtocol?
    init(view: FavouriteVCProtocol) {
        self.view = view
    }
    
}

extension FavouriteViewModal: getFavDoctors {
    
    func getTotalPages() -> Int {
        return totalPages
    }
    
    func deleteFavDocs(id: Int, completion: @escaping() -> Void) {
        self.view?.showLoader()
        APIManager.deleteFavDocs(id: id) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success( _):
                self.view?.hideLoader()
                completion()
            }
        }
    }
    
    func getAllFavDoctors() -> [FavoriteItem] {
        return self.favoriteItems
    }
    
    func sendDoctorData(row: Int) -> FavoriteItem {
        return favoriteItems[row]
    }
    
    func getDocsResponse(deletion: Bool,page: Int,completion: @escaping() -> Void) {
        self.view?.showLoader()
        APIManager.getFavDocs(page: page) { (response) in
            switch response {
            case .failure(let err):
                print(err)
                self.view?.showAlert(title: "Sorry!", massage: "Unauthenticated Error.")
                self.view?.hideLoader()
            case .success(let result):
                self.totalPages = result.data.totalPages
                if deletion {
                    print("in dletion")
                    self.favoriteItems = result.data.items
                }
                else {
                    print("in false dletion")
                    self.favoriteItems += result.data.items
                }
                
                self.view?.hideLoader()
                completion()
            }
        }
    }
}
