//
//  FavouriteView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import UIKit

class FavouriteView: UIView {
    //MARK:- outlets
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var favouriteTableView: UITableView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var doctorIndex = 0
    var count = 1
    var fetch = false
    //MARK:- updateFunction
    func updateUI(){
        favouriteTableView.separatorStyle = .none
        favouriteTableView.rowHeight = UITableView.automaticDimension
        favouriteTableView.estimatedRowHeight = 88
        backGroundImage.image = Asset.component22.image
        resultLabel.text = L10n.resAlert
        resultLabel.textColor = .white
        resultLabel.font = FontFamily.PTSans.bold.font(size: 20)
        resultLabel.isHidden = true
    }
    
    func getfavDoc(count: Int){
        if count == 0 {
            resultLabel.isHidden = false
        }
        else {
            resultLabel.isHidden = true
        }
    }
}
