//
//  AboutUsViewModel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import Foundation
protocol AboutUsViewModalProtocol {
    func getAboutUsInfo(completion: @escaping() -> Void)
    func sendAboutUs()-> String
    func sendTitle()->String
}
class AboutUsViewModal {
    
    weak var view: AboutUsVCProtocol!
    var checkAbout = false
    var aboutUsString = ""
    
    init(view: AboutUsVCProtocol, checkAbout: Bool) {
        self.view = view
        self.checkAbout = checkAbout
    }
    
}
extension AboutUsViewModal: AboutUsViewModalProtocol {
    func sendTitle() -> String {
        if checkAbout == true {
            return L10n.about
        }
        else {
            return L10n.termsCondition
        }
    }
    
    func sendAboutUs() -> String {
        return aboutUsString
    }
    
    func getAboutUsInfo(completion: @escaping() -> Void) {
        self.view.showLoader()
        if checkAbout == true {
            APIManager.aboutUs { [self] (response) in
                switch response {
                case .failure(let err):
                    print(err)
                case .success(let result):
                    self.view.hideLoader()
                    self.aboutUsString = result.data.about_us
                    completion()
                }
            }
        }
        else {
            APIManager.termCondition { [self] (response) in
                switch response {
                case .failure(let err):
                    print(err)
                case .success(let result):
                    self.view.hideLoader()
                    self.aboutUsString = result.data.terms_and_conditions
                    completion()
                }
            }
        }
    }
}
