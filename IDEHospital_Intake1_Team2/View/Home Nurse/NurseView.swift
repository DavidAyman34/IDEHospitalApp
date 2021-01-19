//
//  NurseView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/13/20.
//

import UIKit

class NurseView: UIView {
   //MARK:- outlets
    @IBOutlet weak var nameTextfield: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var mobileNumTextFiled: CustomTextField!
    @IBOutlet weak var detailsTextField: UITextView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var messgLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    // MARK:- Public Methods
    func setup(){
        setUpTF()
        setupImages()
        setupSendBtn()
        updateViews()
        setupDetailsfield()
        textLabel.text = L10n.enterDetails
        textLabel.font = FontFamily.PTSans.bold.font(size: 15)
        contactLabel.text = L10n.contactLabel
        setuplabel(label: messgLabel)
    }
    
    func setUpTF(){
        setupTextField(textField: nameTextfield, image: Asset.component191.image, text: L10n.nameLabel)
        setupTextField(textField: emailTextField, image: Asset.component181.image, text: L10n.emailLabel )
        setupTextField(textField: mobileNumTextFiled, image: Asset.component171.image, text: L10n.mobileLabel)
    }
    
 
        private func setuplabel(label:UILabel){
            label.setuplabel(text: L10n.contactTitle , font: FontFamily.PTSans.regular.font(size: 12))
            label.textAlignment = .center
        }
        private func setupSendBtn(){
            sendBtn.titleLabel?.text = L10n.sendRequest
            sendBtn.titleLabel?.textAlignment = .center
            sendBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
            sendBtn.layer.cornerRadius = sendBtn.frame.height/4
            sendBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
        }
        private func setupImages(){
            backImg.image = Asset.component22.image
            backImg.contentMode = .scaleAspectFill
        }
        private func setupTextField(textField: CustomTextField,image: UIImage, text: String){
            textField.setIcon(image)
            textField.setBottomLine(borderColor: .white, width: Double(self.nameTextfield.frame.width))
            textField.font = FontFamily.PTSans.bold.font(size: 15)
            textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        }
        private func setupDetailsfield(){
            detailsTextField.layer.borderColor = UIColor.white.cgColor
            detailsTextField.backgroundColor = .clear
            detailsTextField.layer.cornerRadius = 8.0
            detailsTextField.layer.masksToBounds = true
            detailsTextField.layer.borderColor = UIColor(named: ColorName.veryLightPink).cgColor
            detailsTextField.font = FontFamily.PTSans.bold.font(size: 15)
            detailsTextField.textAlignment = .left
            detailsTextField.textColor = .white
            detailsTextField.layer.borderWidth = 2.0
        }
        private func updateViews(){
            backView.backgroundColor = .clear
            subView.backgroundColor = .clear
        }
    
    func setPlaceHolder(){
        
        if detailsTextField.text.count == 0 {
            textLabel.isHidden = false
        }
        else {
            textLabel.isHidden = true
        }
    }
    
}
