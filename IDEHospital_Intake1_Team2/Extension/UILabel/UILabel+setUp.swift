//
//  UIViewController+UILabel.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/12/20.
//


import UIKit
extension UILabel {
      func setuplabel(text: String,font: UIFont){
          self.textColor = UIColor(named: ColorName.white)
          self.font = font
          self.text = text
          
      }
    
}
