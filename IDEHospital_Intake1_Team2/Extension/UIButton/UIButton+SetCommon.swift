//
//  CommonButtons.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/16/20.
//
import UIKit

extension UIButton {
    func setButtonDesign(title: String){
        self.backgroundColor = UIColor(named: ColorName.commonButton)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor(named: ColorName.white), for: .normal)
        self.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
    }
    func setNoDesign(title: String){
        self.backgroundColor = UIColor(named: ColorName.purble)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor(named: ColorName.white), for: .normal)
        self.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
    }
}
