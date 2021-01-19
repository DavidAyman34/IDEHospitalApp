//
//  SearchView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/9/20.
//

import UIKit

class SearchView: UIView {
    
    //MARK:- outlets Views
    @IBOutlet weak var supView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet var backView: [UIView]!
    
    // MARK:- Outets
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var backGroundImg: UIImageView!
    @IBOutlet weak var specialistsTextFeild: UITextField!
    @IBOutlet weak var cityTextfield: UITextField!
    @IBOutlet weak var companiesTextField: UITextField!
    @IBOutlet weak var docNameTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var findBtn: UIButton!
    
    // MARK: - Properties
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()
    let pickerView3 = UIPickerView()
    let pickerView4 = UIPickerView()
    let toolBar = UIToolbar()
    var cityID = 0
    var specialCheck = false
    var cityCheck = false
    var regionCheck = false
    var companyCheck = false
    var mainId = 0
    var specialityId = 0
    var regionId = 0
    
      
    // MARK:- Public Methods
    
    func setup(){
        setupImages()
        updateViews()
        setUpTextFields()
        setupFindBtn()
    }
    
    // MARK:- Private Methods
    private func setupImages(){
        backGroundImg.image = Asset.component22.image
        backGroundImg.contentMode = .scaleAspectFill
    }
    
    func setPickerCheck(special:Bool, city: Bool, region: Bool, company: Bool){
        specialCheck = special
        cityCheck = city
        regionCheck = region
        companyCheck = company
        
    }
    
    func setUpTextFields(){
        titileLabel.setuplabel(text: L10n.secondLabel, font: FontFamily.PTSans.bold.font(size: 40))
        infoLabel.setuplabel(text: L10n.mainLabel,font: FontFamily.PTSans.regular.font(size: 20))
        setupTextField(textField: specialistsTextFeild, title: L10n.specialists )
        setupTextField(textField: cityTextfield, title: L10n.city )
        setupTextField(textField: regionTextField, title: L10n.region)
        setupTextField(textField: companiesTextField, title: L10n.companies)
        setupTextField(textField: docNameTextField, title: L10n.doctor)
    }
    
    private func setupFindBtn(){
        findBtn.titleLabel?.text = L10n.doctor
        findBtn.titleLabel?.textAlignment = .center
        findBtn.titleLabel?.font = FontFamily.PTSans.bold.font(size: 20)
        findBtn.layer.cornerRadius = findBtn.frame.height/4
        findBtn.backgroundColor = UIColor(named: ColorName.darkRoyalBlue)
    }
    
    private func setupTextField(textField: UITextField, title: String){
        textField.backgroundColor = .clear
        //  textField.setLeftPaddingPoints(5)
        // textField.setRightPaddingPoints(5)
        textField.placeholder = title
        textField.textAlignment = .left
        textField.textColor = .black
        textField.layer.cornerRadius = 8
        textField.font = FontFamily.PTSans.regular.font(size: 20)
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        //
    }
    
    private func updateViews(){
        view1.backgroundColor = UIColor(patternImage: Asset.path22.image)
        view2.backgroundColor = UIColor(patternImage: Asset.path22.image)
        view3.backgroundColor = UIColor(patternImage: Asset.path22.image)
        view4.backgroundColor = UIColor(patternImage: Asset.path22.image)
        view5.backgroundColor = UIColor(patternImage: Asset.path22.image)
        view1.layer.cornerRadius = 2
        view2.layer.cornerRadius = 2
        view3.layer.cornerRadius = 2
        view4.layer.cornerRadius = 2
        view5.layer.cornerRadius = 2
        supView.backgroundColor = .clear
        for view in backView {
            view.layer.cornerRadius = 8
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
}

