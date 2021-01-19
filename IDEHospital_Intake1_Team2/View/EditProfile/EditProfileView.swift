//
//  EditProfileView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/9/21.
//

import UIKit

class EditProfileView: UIView {
    // MARK:- Outlets
    @IBOutlet weak var nameTF: CustomTextField!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var phone: CustomTextField!
    @IBOutlet weak var oldPass: CustomTextField!
    @IBOutlet weak var newPassTF: CustomTextField!
    @IBOutlet weak var reNewPassTF: CustomTextField!
    @IBOutlet weak var yesDesign: UIButton!
    @IBOutlet weak var noDesign: UIButton!
    
    // MARK:- updateUI
    func updateUI() {
        yesDesign.setButtonDesign(title: L10n.save)
        noDesign.setNoDesign(title: L10n.cancel)
        setupTextField(textField: nameTF, image: Asset.component191.image, text: L10n.nameLabel)
        setupTextField(textField: emailTF, image: Asset.component181.image, text: L10n.emailLabel )
        setupTextField(textField: phone, image: Asset.component171.image, text: L10n.mobileLabel)
        setupTextField(textField: newPassTF, image: Asset.component141.image, text: L10n.newPassword )
        setupTextField(textField: reNewPassTF, image: Asset.component141.image, text: L10n.confPassword)
        setupTextField(textField: oldPass, image: Asset.component141.image, text: L10n.oldForma)
    }
    // MARK:- textField
    private func setupTextField(textField: CustomTextField,image: UIImage, text: String) {
        textField.setIcon(image)
        textField.setBottomLine(borderColor: .white, width: Double(self.nameTF.frame.width - 32))
        textField.font = FontFamily.PTSans.bold.font(size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    func setUserData(data: userInfo){
        nameTF.text = data.name
        emailTF.text = data.email
        phone.text = data.mobile
    }
}
