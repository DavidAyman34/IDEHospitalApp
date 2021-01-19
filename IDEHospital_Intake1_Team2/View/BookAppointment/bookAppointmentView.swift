//
//  bookAppointmentView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit

class bookAppointmentView: UIView {
    //MARK:- outlets
    @IBOutlet weak var mainAppointView: UIView!
    
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var detailsConfirmLabel: UILabel!
    @IBOutlet weak var confirmDesign: UIButton!
    //MARK:- updateUI
    func updateUI(){
        mainAppointView.setupViews(radius: 16)
        confirmLabel.font = FontFamily.PTSans.bold.font(size: 15)
        confirmDesign.setButtonDesign(title: "Confirm")
        
    }
    //MARK:- setDetails
    func setDetailLabel(appointment: Int, name: String){
        let appoint = convertDate(time: appointment)
        let longString = "You are about to book an Appointment \(appoint[0]) \(appoint[1]) With \(name)"
        let longestWord = "\(appoint[0]) \(appoint[1]) With \(name)"
        let longestWordRange = (longString as NSString).range(of: longestWord)
        
        let attributedString = NSMutableAttributedString(string: longString, attributes: [NSAttributedString.Key.font : FontFamily.PTSans.regular.font(size: 15)])
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        attributedString.setAttributes([NSAttributedString.Key.font : FontFamily.PTSans.bold.font(size: 15), NSAttributedString.Key.foregroundColor : UIColor.black], range: longestWordRange)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, longString.count))
        
        detailsConfirmLabel.attributedText = attributedString
        detailsConfirmLabel.textAlignment = .center
    }
    
}
