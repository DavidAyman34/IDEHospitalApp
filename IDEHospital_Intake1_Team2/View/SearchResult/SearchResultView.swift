//
//  SearchResultView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/21/20.
//

import UIKit

class SearchResultView: UIView {
    
    //MARK:- outlets
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var sortView: UIView!
    @IBOutlet weak var sortTextField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    
    // MARK: - Properties
    let sortPickerView = UIPickerView()
    var doctorIndex = 0
    var count = 0
    var fetch = false
    var sortArray = ["fees", "rating"]
    //MARK:- updateFunction
    func updateUI(){
        setUpColors()
        setUpImage()
    }
    
    func setUpColors() {
        sortTextField.font = FontFamily.PTSans.regular.font(size: 12)
        sortTextField.textColor = .white
        sortView.backgroundColor = UIColor(named: ColorName.commonButton)
    }
    
    func setUpImage() {
        backGroundImage.image = Asset.component22.image
    }
    
    func setupTextField(_ textField: UITextField, _ title: String){
        textField.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .left
        textField.textColor = .white
        textField.setLeftPaddingPoints(32)
        textField.setRightPaddingPoints(5)
        textField.font = FontFamily.PTSans.regular.font(size: 12)
    }
    
}
