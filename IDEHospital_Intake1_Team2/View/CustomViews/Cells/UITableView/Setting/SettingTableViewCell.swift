//
//  SettingTableViewCell.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var settingImage: UIImageView!
    
    @IBOutlet weak var settingName: UILabel!
    @IBOutlet weak var arrowSetting: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
