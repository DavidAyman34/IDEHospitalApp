//
//  SettingVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import UIKit
protocol settingProtocol: class {
    func showLoader()
    func hideLoader()
    func switchToLogin()
    func switchToAbout()
    func switchToTerm()
    func switchToNurse()

    func switchToShare()
    
    func switchToProfile()
    func switchToFav()
    func switchToAppoint()
    func switchToLogout()
}
class SettingVC: UIViewController {
    
    // MARK:- outLets
    @IBOutlet var settingView: SettingView!
    private var settingViewModel: SettingViewModal!
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation1(view: self, settingAcion: nil, backAcion: #selector(backBtnTapped), title: L10n.setting, backColor: UIColor(named: ColorName.commonButton), tintColor: .white)
        
    }
    // MARK:- navMedthods
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    class func create() -> SettingVC {
        let settingVC: SettingVC = UIViewController.create(storyboardName: Storyboards.Setting, identifier: ViewControllers.SettingVC)
        settingVC.settingViewModel = SettingViewModal(view: settingVC)
        return settingVC
    }
    
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK:- tableViewMethods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.returnNames().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingView.settingTableView.dequeueReusableCell(withIdentifier: L10n.cellName, for: indexPath) as! SettingTableViewCell
        cell.settingName.text = settingViewModel.returnNames()[indexPath.row]
        cell.settingImage.image = settingViewModel.returnImages()[indexPath.row]
        cell.settingName.textColor = UIColor(named: ColorName.commonButton)
        cell.arrowSetting.setImage(Asset.blueBack.image, for: .normal)
        cell.arrowSetting.tintColor = UIColor(named: ColorName.commonButton)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingViewModel.setSetting(row: indexPath.row)
    }
    
    
    
}
extension SettingVC: settingProtocol {
    func switchToLogin() {
        let login = SignInVC.create()
        self.navigationController?.pushViewController(login, animated: true)
    }
    
    func switchToAbout() {
        let about = AboutUsVC.create(isAbout: true)
        self.navigationController?.pushViewController(about, animated: true)
    }
    
    func switchToTerm() {
        let about = AboutUsVC.create(isAbout: false)
        self.navigationController?.pushViewController(about, animated: true)
    }
    
    func switchToNurse() {
        let contact = NurseVC.create(checkContact: true)
        self.navigationController?.pushViewController(contact, animated: true)
    }
    
    func switchToShare() {
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func switchToProfile() {
        let edit = EditProfileVC.create()
        self.navigationController?.pushViewController(edit, animated: true)
    }
    
    func switchToFav() {
        let favorite = FavouriteVC.create()
        self.navigationController?.pushViewController(favorite, animated: true)
    }
    
    func switchToAppoint() {
        let appointment = AppointmentVC.create()
        self.navigationController?.pushViewController(appointment, animated: true)
    }
    
    func switchToLogout() {
        UserDefaultsManager.shared().token = nil
        self.navigationController?.popViewController(animated: true)
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
}
