//
//  CancelAppointmentView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit

class CancelAppointmentView: UIView {
    
    
    @IBOutlet weak var mainCancelAppointment: UIView!
    
    @IBOutlet weak var cancelLabel: UILabel!
    @IBOutlet weak var yesDesign: UIButton!
    @IBOutlet weak var noDesign: UIButton!
    
    func updateUI(){
        mainCancelAppointment.setupViews(radius: 16)
        cancelLabel.font = FontFamily.PTSans.bold.font(size: 15)
        yesDesign.setButtonDesign(title: "Yes")
        noDesign.setNoDesign(title: "No")
    }
}
