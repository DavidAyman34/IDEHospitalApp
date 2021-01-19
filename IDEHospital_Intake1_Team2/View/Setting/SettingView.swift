//
//  SettingView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/28/20.
//

import UIKit

class SettingView: UIView {

    @IBOutlet weak var settingTableView: UITableView!
    
    var unLoginSettingArray = [L10n.editProfile, L10n.favorites, L10n.bookedAppointment, L10n.aboutUs, L10n.contactUs, L10n.share, L10n.termsCondition, L10n.logout]
    var unLoginImageArray = [Asset.user.image, Asset.blueheart.image, Asset.calendar.image, Asset.about.image, Asset.contact.image, Asset.share.image, Asset.sheet.image, Asset.login.image]
    
    var LoginSettingArray = [L10n.login, L10n.aboutUs, L10n.contactUs, L10n.share, L10n.termsCondition]
    var LoginImageArray = [Asset.login.image, Asset.about.image, Asset.contact.image, Asset.share.image, Asset.sheet.image]

}
