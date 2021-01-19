//
//  SignInView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import UIKit

class SignInView: UIView {
    
    //MARK:- outlets Views
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var backView: UIView!
    
    //MARK:- outlets
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passTextField: CustomTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgetPassBtn: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    // MARK:- Public Methods
    func setup(){
        setupTextField(textField: emailTextField, image: Asset.component181.image, text: L10n.emailLabel )
        setupTextField(textField: passTextField, image: Asset.component141.image, text: L10n.enterpass)
        setupImages()
        updateViews()
        setupSignInBtn()
        setupSignUpBtn()
        setupForgetPass()
        setupAccLabel()
    }
    // MARK:- Private Methods
    private func setupImages(){
        backImg.image = Asset.component22.image
        backImg.contentMode = .scaleAspectFill
    }
    private func setupForgetPass(){
        forgetPassBtn.setTitle(L10n.forgetPass, for: .normal)
        forgetPassBtn.backgroundColor = .clear
        forgetPassBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 15)
        forgetPassBtn.titleLabel?.textColor = UIColor(named: ColorName.veryLightPink)
    }
    private func setupAccLabel(){
        accountLabel.setuplabel(text: L10n.accLabel, font: FontFamily.PTSans.regular.font(size: 12))
    }
    private func setupSignUpBtn(){
        signUpBtn.setTitle(L10n.signUpBtn, for: .normal)
        signUpBtn.titleLabel?.textAlignment = .center
        signUpBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        signUpBtn.layer.cornerRadius = signUpBtn.frame.height/4
        signUpBtn.backgroundColor = UIColor(named: ColorName.steelGrey)
    }
    
    private func setupSignInBtn(){
        loginBtn.setTitle(L10n.signInBtn, for: .normal)
        loginBtn.titleLabel?.textAlignment = .center
        loginBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        loginBtn.layer.cornerRadius = loginBtn.frame.height/4
        loginBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
    }
    private func setupTextField(textField: CustomTextField,image: UIImage, text: String){
        textField.setIcon(image)
        textField.setBottomLine(borderColor: .white, width: Double(self.loginBtn.frame.width))
        textField.font = FontFamily.PTSans.bold.font(size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
    private func updateViews(){
        backView.backgroundColor = .clear
        subView.backgroundColor = .clear
        
    }
}
