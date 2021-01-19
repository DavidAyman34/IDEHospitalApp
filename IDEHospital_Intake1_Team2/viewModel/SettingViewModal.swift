//
//  SettingViewModal.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/1/21.
//

import UIKit
protocol SettingViewModalProtocol {
    func returnNames()->[String]
    func returnImages()->[UIImage]
    func setSetting(row: Int)
    
}
class SettingViewModal {
    
    weak var view: settingProtocol!
    var unLoginSettingArray = [L10n.editProfile, L10n.favorites, L10n.bookedAppointment, L10n.aboutUs, L10n.contactUs, L10n.share, L10n.termsCondition, L10n.logout]
    var unLoginImageArray = [Asset.user.image, Asset.blueheart.image, Asset.calendar.image, Asset.about.image, Asset.contact.image, Asset.share.image, Asset.sheet.image, Asset.login.image]
    
    var LoginSettingArray = [L10n.login, L10n.aboutUs, L10n.contactUs, L10n.share, L10n.termsCondition]
    var LoginImageArray = [Asset.login.image, Asset.about.image, Asset.contact.image, Asset.share.image, Asset.sheet.image]
    
    init(view: settingProtocol) {
        self.view = view
        
    }
    
}
extension SettingViewModal:SettingViewModalProtocol {
    func setSetting(row: Int) {
        if UserDefaultsManager.shared().token == nil {
            if row == 0 {
                self.view.switchToLogin()
                
            }
            else if row == 1 {
                self.view.switchToAbout()
                
            }
            else if row == 2 {
                self.view.switchToNurse()
                
            }
            else if row == 3 {
                self.view.switchToShare()
            }
            else if row == 4 {
                self.view.switchToTerm()
                
            }
        }
        else {
            if row == 0 {
                self.view.switchToProfile()
            }
            else if row == 1 {
                self.view.switchToFav()
                
            }
            else if row == 2 {
                self.view.switchToAppoint()
                
            }
            else if row == 3 {
                self.view.switchToAbout()
                
            }
            else if row == 4 {
                self.view.switchToNurse()
            }
            else if row == 5 {
                self.view.switchToShare()
            }
            else if row == 6 {
                self.view.switchToTerm()
            }
            else if row == 7 {
                self.view.switchToLogout()
            }
        }
    }
    
    func returnImages() -> [UIImage] {
        if UserDefaultsManager.shared().token == nil {
            return LoginImageArray
        }
        else {
            return unLoginImageArray
        }
    }
    
    func returnNames() -> [String] {
        if UserDefaultsManager.shared().token == nil {
            return LoginSettingArray
        }
        else {
            return unLoginSettingArray
        }
    }
    
    
}
