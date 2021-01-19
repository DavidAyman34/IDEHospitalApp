//
//  RegisterView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 1/9/21.
//

import UIKit

class RegisterView: UIView {
    //MARK:- outlets Views
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var voucherCheck: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var anotherCheck: UIView!
    //MARK:- outlets
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var mobileNumTextFiled: CustomTextField!
    @IBOutlet weak var choosePassowordTextField: CustomTextField!
    @IBOutlet weak var voucherCodeTextField: CustomTextField!
    @IBOutlet weak var anotherTextField: CustomTextField!
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var voucherLabel: UILabel!
    @IBOutlet weak var anotherLabel: UILabel!
    @IBOutlet weak var registBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var termsBtn: UIButton!
    @IBOutlet weak var mobileHeghit: NSLayoutConstraint!
    
    @IBOutlet weak var anotherOutbtn: UIButton!
    @IBOutlet weak var voucherOutBtn: UIButton!
    @IBOutlet weak var passTop: NSLayoutConstraint!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var overlayView: UIView!
    
    
    // MARK:- Public Methods
    func setup(){
        conditionsLabel.text = L10n.enterDetails
        conditionsLabel.font = FontFamily.PTSans.bold.font(size: 15)
        
        setupTextField(textField: userNameTextField, image: Asset.component191.image, text: L10n.nameLabel)
        setupTextField(textField: emailTextField, image: Asset.component181.image, text: L10n.emailLabel )
        setupTextField(textField: mobileNumTextFiled, image: Asset.component171.image, text: L10n.mobileLabel)
        setupTextField(textField: choosePassowordTextField, image: Asset.component141.image, text: L10n.passwordLabel )
        setupOpshinalTextField(textField: voucherCodeTextField, text: "Enter Code")
        setupOpshinalTextField(textField: anotherTextField, text: "Enter Name")
        setuplabel(label: voucherLabel, text: "I Have a Voucher Code")
        setuplabel(label: anotherLabel, text: "Book for another person!")
        setuplabel(label: conditionsLabel, text: L10n.conditionsLabel)
        updateViews()
        setupTermsBtn()
        setupButtom(button: registBtn, text: "Register", tapped: false)
        setupButtom(button: loginBtn, text: "Login", tapped: true)
        setupSignUpBtn()
        voucherCodeTextField.isEnabled = false
        anotherOutbtn.setImage(Asset.rectangle1798.image, for: .normal)
       
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 12),
              .foregroundColor: UIColor.white,
              .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Terms&Conditions",
                                                             attributes: yourAttributes)
        termsBtn.setAttributedTitle(attributeString, for: .normal)
        termsBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
        disable(dis: false)
    }
    func changeView(bool: Bool){
        disable(dis: bool)
        setupButtom(button: registBtn, text: "Register", tapped: bool)
        setupButtom(button: loginBtn, text: "Login", tapped: !bool)
        
    }
    private func disable(dis: Bool){
        if dis == true{
            userNameTextField.isHidden = true
            mobileNumTextFiled.isHidden = true
            passTop.constant = 0
            mobileHeghit.constant = 0
            choosePassowordTextField.attributedPlaceholder = NSAttributedString(string: "\(L10n.enterpass)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            closeBtn.setImage(Asset.component64.image, for: .normal)
            SignUpBtn.setTitle(L10n.popLogin, for: .normal)
        }
        else{
            userNameTextField.isHidden = false
            mobileNumTextFiled.isHidden = false
            passTop.constant = 25
            mobileHeghit.constant = 40
             closeBtn.setImage(Asset.component67.image, for: .normal)
            SignUpBtn.setTitle(L10n.popSignUpp, for: .normal)
        }
    }
    // MARK:- Private Methods
    private func setuplabel(label:UILabel, text: String){
        label.setuplabel(text: text , font: FontFamily.PTSans.bold.font(size: 12))
        label.textColor = .white
        
        
    }
    private func setupConditionsLabel(){
        conditionsLabel.setuplabel(text:  L10n.conditionsLabel , font: FontFamily.PTSans.regular.font(size: 12))
        conditionsLabel.textColor = .white
        
        
    }
    private func setupTermsBtn(){
        termsBtn.setTitle(L10n.termsBtn, for: .normal)
        termsBtn.titleLabel?.textAlignment = .left
        termsBtn.titleLabel?.font = UIFont(name: FontFamily.PTSans.bold.name, size: 12)
        
        
    }
    
    private func setupButtom(button: UIButton, text: String,tapped: Bool){
        button.setTitle(text, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont(name: FontFamily.PTSans.bold.name, size: 20)
        if tapped == true{
            button.backgroundColor = .clear
            button.setTitleColor(UIColor.white, for: .normal)
            
        }
        else{
            button.backgroundColor = .white
            button.setTitleColor(UIColor(named: ColorName.darkRoyalBlue), for: .normal)
        }
        
    }
    private func setupTextField(textField: CustomTextField,image: UIImage, text: String){
        textField.setIcon(image)
        textField.setBottomLine(borderColor: .white, width: Double(self.SignUpBtn.frame.width))
        textField.font = FontFamily.PTSans.bold.font(size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    private func setupOpshinalTextField(textField: CustomTextField, text: String){
        
        textField.setBottomLine(borderColor: .white, width: Double(self.SignUpBtn.frame.width))
        textField.font = FontFamily.PTSans.bold.font(size: 12)
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    private func setupSignUpBtn(){
        
        SignUpBtn.setTitle(L10n.popSignUpp, for: .normal)
        SignUpBtn.titleLabel?.textAlignment = .center
        SignUpBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 17)
        SignUpBtn.layer.cornerRadius = SignUpBtn.frame.height/4
        SignUpBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
    }
    private func setupCheckViews(){
        voucherCheck.backgroundColor = .clear
        //anotherCheck.backgroundColor = .clear
        anotherCheck.layer.borderColor = UIColor(named: ColorName.veryLightPink).cgColor
        anotherCheck.layer.borderWidth = 1
        voucherCheck.layer.borderWidth = 1
        voucherCheck.layer.borderColor = UIColor(named: ColorName.veryLightPink).cgColor
    }
    
    private func updateViews(){
        subView.backgroundColor = UIColor(patternImage: Asset.component71.image)
        subView.layer.cornerRadius = 17
        contentView.backgroundColor = .clear
        
        //         loginBtn.layer.cornerRadius = 15
        
    }
    
}
