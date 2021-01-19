//
//  AppointmentsView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import UIKit

class AppointmentsView: UIView {

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var appointmentTableView: UITableView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var doctorIndex = 0
    var lat: Double = 0.0
    var lng: Double = 0.0
    var count = 1
    var fetch = false
    func updateUI(){
        appointmentTableView.separatorStyle = .none
        appointmentTableView.rowHeight = UITableView.automaticDimension
        appointmentTableView.estimatedRowHeight = 88
        backgroundView.image = Asset.component22.image
        resultLabel.text = L10n.noResultFound
        resultLabel.textColor = .white
        resultLabel.font = FontFamily.PTSans.bold.font(size: 20)
        resultLabel.isHidden = true
    }
    func getappDoc(count: Int) {
        if count == 0 {
            resultLabel.isHidden = false
        }
        else {
            resultLabel.isHidden = true
        }
    }
}
