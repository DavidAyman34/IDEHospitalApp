//
//  AddCommentViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 1/4/21.
//

import Foundation

// MARK:- Protocol Methods
protocol AddCommentViewModelProtocol {
    func saveComment(rate: Int, comment: String)
    
    
}
class AddCommentViewModel{
    
    // MARK:- Properties
    weak var view: AddCommentProtocol!
    var id = 0
    // MARK:- Initialization Methods
    init(view: AddCommentProtocol, id: Int) {
        self.view = view
        self.id = id
    }
    
    // MARK:- Private Methods
    private func addComment(rate: Int, comment: String){
        self.view!.showLoader()
        APIManager.addComment(doctorId: id, rate: rate, comment: comment) { (response) in
            switch response {
            case .failure(let error):
                print(error)
                
            case .success(let result):
                print(result)
                if result.code == 202 {
                    self.view.showAlert(img: Asset.successAlert.image, message: L10n.saveReview)
                }
                else{
                    self.view.showError(title: "", massage: result.errors!)
                }
            }
            self.view!.hideLoader()
        }
    }
}

// MARK: - Implement Protocols
extension AddCommentViewModel: AddCommentViewModelProtocol{
    func saveComment(rate: Int, comment: String) {
        if view.check() == true{
            addComment(rate: rate, comment: comment)
        }
        else{
            self.view.showError(title: "", massage: L10n.writeSomething)
        }
    }
    
    
    
    
    
}
