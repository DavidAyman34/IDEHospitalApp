//
//  VoucherView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit

class VoucherView: UIView {
    //MARK:- outlets
    @IBOutlet weak var mainVoucherView: UIView!
    
    @IBOutlet weak var voucherCodeLabel: UILabel!
    
    @IBOutlet weak var codeSwitch: UISwitch!
    
    @IBOutlet weak var codeTF: UITextField!
    
    @IBOutlet weak var anotherPersonLabel: UILabel!
    
    @IBOutlet weak var personSwitch: UISwitch!
    
    @IBOutlet weak var personNameTF: UITextField!
    
    @IBOutlet weak var continueDesign: UIButton!
    
    @IBOutlet weak var yesCode: UILabel!
    @IBOutlet weak var noCode: UILabel!
    @IBOutlet weak var yesName: UILabel!
    @IBOutlet weak var noName: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    
    var isOnCode = false
    var isOnName = false
    //MARK:- updateUI
    func updateUI(){
        //        overlayView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        yesCode.font = FontFamily.PTSans.bold.font(size: 15)
        noCode.font = FontFamily.PTSans.bold.font(size: 15)
        yesName.font = FontFamily.PTSans.bold.font(size: 15)
        noName.font = FontFamily.PTSans.bold.font(size: 15)
        yesCode.textColor = UIColor(named: ColorName.commonButton)
        noCode.textColor = UIColor(named: ColorName.commonButton)
        yesName.textColor = UIColor(named: ColorName.commonButton)
        noName.textColor = UIColor(named: ColorName.commonButton)
        mainVoucherView.setupViews(radius: 16)
        voucherCodeLabel.font = FontFamily.PTSans.bold.font(size: 15)
        voucherCodeLabel.textColor = UIColor(named: ColorName.commonButton)
        codeSwitch.tintColor = UIColor(named: ColorName.commonButton)
        codeSwitch.onTintColor = UIColor(named: ColorName.veryLightPink)
        codeSwitch.thumbTintColor = UIColor.white
        codeSwitch.backgroundColor = UIColor(named: ColorName.commonButton)
        codeSwitch.layer.cornerRadius = 16
        codeSwitch.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        codeTF.layer.cornerRadius = 8
        codeTF.layer.borderWidth = 1
        codeTF.layer.borderColor = #colorLiteral(red: 0, green: 0.151042819, blue: 0.4802260399, alpha: 1)
        
        anotherPersonLabel.font = FontFamily.PTSans.bold.font(size: 15)
        anotherPersonLabel.textColor = UIColor(named: ColorName.commonButton)
        
        personSwitch.tintColor = UIColor(named: ColorName.commonButton)
        personSwitch.onTintColor = UIColor(named: ColorName.veryLightPink)
        personSwitch.thumbTintColor = UIColor.white
        personSwitch.backgroundColor = UIColor(named: ColorName.commonButton)
        personSwitch.layer.cornerRadius = 16
        personSwitch.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.isOpaque = false
        //        self.backgroundColor = .clear
        personNameTF.layer.cornerRadius = 8
        personNameTF.layer.borderWidth = 1
        personNameTF.layer.borderColor = #colorLiteral(red: 0, green: 0.151042819, blue: 0.4802260399, alpha: 1)
        //self.mainVoucherView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        codeTF.isHidden = true
        personNameTF.isHidden = true
        
        continueDesign.setButtonDesign(title: "Continue")
        
    }
    
    func setSwitch(sender: UISwitch){
        if sender.isOn {
            setCodeSwitch(isHidden: true, isOK: false)
        }
        else {
            setCodeSwitch(isHidden: false, isOK: true)
        }
    }
    
    func setPSwitch(sender: UISwitch){
        if sender.isOn {
            setNameSwitch(isHidden: true, isOK: false)
        }
        else {
            setNameSwitch(isHidden: false, isOK: true)
        }
    }
    
    func setCodeSwitch(isHidden: Bool, isOK: Bool){
        codeTF.isHidden = isHidden
        isOnCode = isOK
    }
    func setNameSwitch(isHidden: Bool, isOK: Bool){
        personNameTF.isHidden = isHidden
        isOnName = isOK
    }
    
    
}
