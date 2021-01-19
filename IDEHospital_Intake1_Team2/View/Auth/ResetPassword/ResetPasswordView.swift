//
//  ResetPasswordView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import UIKit

class ResetPasswordView: UIView {
    
    //MARK:- outlets Views
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var backView: UIView!
    //MARK:- outlets
    @IBOutlet weak var newPassBtn: UIButton!
    @IBOutlet weak var backimg: UIImageView!
    @IBOutlet weak var emailTextField: CustomTextField!
    // MARK:- Public Methods
    
    func setup(){
        setupTextField(textField: emailTextField, image: Asset.component181.image, text: L10n.emailLabel)
        updateViews()
        setupNewPassBtn()
        setupImages()
    }
    
    // MARK:- Private Methods
    private func setupImages(){
        backimg.image = Asset.component22.image
        backimg.contentMode = .scaleAspectFill
    }
    private func setupTextField(textField: CustomTextField,image: UIImage, text: String){
        textField.setIcon(image)
        textField.setBottomLine(borderColor: .white, width: Double(self.emailTextField.frame.width))
        textField.font = FontFamily.PTSans.bold.font(size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    private func setupNewPassBtn(){
        
        newPassBtn.setTitle(L10n.resetBtn, for: .normal)
        newPassBtn.titleLabel?.textAlignment = .center
        newPassBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        newPassBtn.layer.cornerRadius = newPassBtn.frame.height/4
        newPassBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
    }
    private func updateViews(){
        backView.backgroundColor = .clear
        subView.backgroundColor = .clear
        
    }
}
