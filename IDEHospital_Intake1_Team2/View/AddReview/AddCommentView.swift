//
//  AddCommentView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 1/4/21.
//

import UIKit
import Cosmos
class AddCommentView: UIView {
    
    //MARK:- outlets Views
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var backView: UIView!
    //MARK:- outlets
    @IBOutlet weak var submitReviewBtn: UIButton!
    @IBOutlet weak var backimg: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentTextField: CustomTextField!
    @IBOutlet weak var rateView: CosmosView!
    
    // MARK:- Public Methods
    
    func setup(){
        setupTextField(textField: commentTextField,text: L10n.addcommentTextField)
        setuplabel(label: commentLabel, text: L10n.addCommentLabel)
        updateViews()
        setupNewPassBtn()
        setupImages()
        rateView.settings.updateOnTouch = true
        rateView.settings.filledImage = Asset.rate.image
        rateView.settings.emptyImage = Asset.unfill.image
        rateView.settings.fillMode = .precise
        rateView.rating = 0
    }
    
    // MARK:- Private Methods
    private func setupImages(){
        backimg.image = Asset.component22.image
        backimg.contentMode = .scaleAspectFill
    }
    private func setupTextField(textField: CustomTextField, text: String){
        
        textField.setBottomLine(borderColor: .white, width: Double(self.submitReviewBtn.frame.width))
        textField.font = FontFamily.PTSans.bold.font(size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    private func setuplabel(label:UILabel, text: String){
           label.setuplabel(text: text , font: FontFamily.PTSans.bold.font(size: 14))
           // label.textAlignment = .center
    }
           
    private func setupNewPassBtn(){
        
        submitReviewBtn.setTitle(L10n.submitBtn, for: .normal)
        submitReviewBtn.titleLabel?.textAlignment = .center
        submitReviewBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        submitReviewBtn.layer.cornerRadius = submitReviewBtn.frame.height/4
        submitReviewBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
    }
    private func updateViews(){
        backView.backgroundColor = .clear
        subView.backgroundColor = .clear
        
    }
}


