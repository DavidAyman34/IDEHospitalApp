//
//  SuccessBookView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit

class SuccessBookView: UIView {

   
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var successMsg: UILabel!
    
    @IBOutlet weak var okDesign: UIButton!
    @IBOutlet weak var successImage: UIImageView!
    
    func updateUI(){
        successView.setupViews(radius: 16)
        successMsg.font = FontFamily.PTSans.bold.font(size: 15)
        successMsg.textColor = UIColor(named: ColorName.commonButton)
        okDesign.setButtonDesign(title: "OK")
    }
}
