//
//  AboutView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import UIKit

class AboutView: UIView {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var testView: UIView!
    
    func updateUI(){
        aboutLabel.font = FontFamily.PTSans.regular.font(size: 12)
        aboutLabel.textColor = .white
        aboutLabel.bottomAnchor.constraint(equalTo: testView.topAnchor, constant: -20).isActive = true
    }
    
}











//    func setTextWithLineSpacing(label:UILabel,text:NSAttributedString,lineSpacing:CGFloat)
//    {
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = lineSpacing
//
//        let attrString = NSMutableAttributedString(attributedString: text)
//        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
//
//        label.attributedText = attrString
//    }

//
//
//        print("@#$")
////        print(about.htmlFormat().mutableString)
////        aboutView.aboutLabel.text = about.htmlFormat().mutableString as String
//        print(about.htmlToString)
//        aboutView.aboutLabel.text = about.htmlToString
//        print("^%$")
