//
//  SignUpView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import UIKit

class SignUpView: UIView {
    
    //MARK:- outlets Views
    @IBOutlet weak var backImag: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var backView: UIView!
    
    //MARK:- outlets
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var mobileNumTextFiled: CustomTextField!
    @IBOutlet weak var choosePassowordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var conditionsLabel: UILabel!
    
    @IBOutlet weak var termDesign: UIButton!
    // MARK:- Public Methods
    func setup(){
        conditionsLabel.text = L10n.enterDetails
        conditionsLabel.font = FontFamily.PTSans.bold.font(size: 15)
        
        setupTextField(textField: userNameTextField, image: Asset.component191.image, text: L10n.nameLabel)
        setupTextField(textField: emailTextField, image: Asset.component181.image, text: L10n.emailLabel )
        setupTextField(textField: mobileNumTextFiled, image: Asset.component171.image, text: L10n.mobileLabel)
        setupTextField(textField: choosePassowordTextField, image: Asset.component141.image, text: L10n.passwordLabel )
        setupTextField(textField: confirmPasswordTextField, image: Asset.component141.image, text: L10n.confirmPassword)
        setupImages()
        setuplabel(label: conditionsLabel)
        setupSignUpBtn()
        updateViews()
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 12),
              .foregroundColor: UIColor.white,
              .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Terms&Conditions",
                                                             attributes: yourAttributes)
        termDesign.setAttributedTitle(attributeString, for: .normal)
        termDesign.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
        
    }
    
    // MARK:- Private Methods
    private func setuplabel(label:UILabel){
        label.setuplabel(text: L10n.conditionsLabel , font: FontFamily.PTSans.regular.font(size: 12))
        // label.textAlignment = .center
        
        
    }
    private func setupSignUpBtn(){
        
        SignUpBtn.setTitle(L10n.signUpBtn, for: .normal)
        SignUpBtn.titleLabel?.textAlignment = .center
        SignUpBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        SignUpBtn.layer.cornerRadius = SignUpBtn.frame.height/4
        SignUpBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
    }
    private func setupImages(){
        backImag.image = Asset.component22.image
        backImag.contentMode = .scaleAspectFill
    }
    private func setupTextField(textField: CustomTextField,image: UIImage, text: String){
        textField.setIcon(image)
        textField.setBottomLine(borderColor: .white, width: Double(self.SignUpBtn.frame.width))
        textField.font = FontFamily.PTSans.bold.font(size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
    private func updateViews(){
        backView.backgroundColor = .clear
        subView.backgroundColor = .clear
        
    }
}
