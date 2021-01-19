//
//  doctorProfileCollectionViewCell.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/1/21.
//

import UIKit

class DoctorProfileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var appointLabel: UILabel!
    var select1 = false
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(named: ColorName.niceBlue)
        appointLabel.font = FontFamily.PTSans.bold.font(size: 12)
        appointLabel.textColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        
    }
    override var isSelected: Bool {
        didSet{
            if !self.isSelected {
                contentView.backgroundColor = UIColor(named: ColorName.niceBlue)
            }
        }
    }
}
