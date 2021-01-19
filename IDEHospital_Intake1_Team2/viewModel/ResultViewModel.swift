//
//  ResultViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/22/20.
//

import Foundation

// MARK:- Protocol Methods
protocol ResultViewModelProtocols {
    func getResult()
    func getSearchItems() -> [ResultItem]
    func getItem(row: Int) -> ResultItem
    func addfav(id: Int)
    
    
}
class ResultViewModel {
    
    // MARK:- Properties
    weak var view: SearchResultVCProtocols!
    var searchItems = [ResultItem]()
    private var mainId: Int = 0
    private var specialtyId: Int = 0
    private var cityId: Int?
    private var regionId: Int?
    private var order: String?
    
    // MARK:- Initialization Methods
    init(view: SearchResultVCProtocols,mainId: Int
        ,specialtyId: Int,cityId: Int,regionId: Int) {
        self.view = view
        self.mainId = mainId
        self.specialtyId = specialtyId
        self.cityId = cityId
        self.regionId = regionId
        
    }
    
}


// MARK: - Implement Protocols
extension ResultViewModel: ResultViewModelProtocols{
    
    
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
    
    func getItem(row: Int) -> ResultItem {
        return searchItems[row]
    }
    
    func getSearchItems() -> [ResultItem] {
        return searchItems
    }
    
    func getResult() {
        var order = self.view.sendSortText()
        if order.isEmpty {
            order = "rating"
        }
        
        
        self.view.showLoader()
        APIManager.getSearchResult(mainId: mainId,specialtyId: specialtyId, cityId: cityId!, regionId: regionId!, order: order ) { (response) in
            switch response{
            case .failure(let error):
                print(error)
            case .success(let result):
                print(result)
                if result.data.items.isEmpty == true{
                    self.view.emptyDataMessage()
                } else{
                    self.searchItems = result.data.items
                    self.view.returnTableView()
                }
            }
            self.view.hideLoader()
        }
        
    }
    
    
    
    
    
}
