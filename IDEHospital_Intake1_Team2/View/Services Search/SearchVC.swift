//
//  SearchVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/9/20.
//

import UIKit

// MARK:- Protocol Methods
protocol SearchVCProtocol: class {
    func hideLoader()
    func showLoader()
    func goToResult()
}

class SearchVC: UIViewController, UITextFieldDelegate{
    
    // MARK:- Outets
    @IBOutlet var searchView: SearchView!
    
    // MARK: - Properties
    private var viewModel: SearchViewModelProtocols!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK:- Methods
    func getCategories(){
        viewModel.getData() {
            print("")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == searchView.regionTextField {
            if searchView.cityTextfield.text == "" {
                let alertPayload = AlertPayload(img:Asset.errorBook.image,message: "Choose City First.") {
                    self.dismiss(animated: true, completion: nil)
                }
                Utils.showAlert(payload: alertPayload, parentViewController: self)
            }
        }
    }
    
    
    // MARK:- Button Methods
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    // MARK:- navigation Methods
    @IBAction func findBtnTapped(_ sender: Any) {
        viewModel.findDoctor()
    }
    
    @objc func backBtnTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Public Methods
    class func create(id: Int) -> SearchVC {
        let searchVC: SearchVC = UIViewController.create(storyboardName: Storyboards.Search, identifier: ViewControllers.searchVC)
        searchVC.viewModel = SearchViewModel(view: searchVC,id: id)
        return searchVC
    }
}

// MARK: - Implement Protocols
extension SearchVC: SearchVCProtocol{
    
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    
    func goToResult(){
        let result = SearchResultVC.create(mainId: viewModel.sendMainId(), specialtyId: searchView.specialityId, cityId: viewModel.sendCityId(), regionId: searchView.regionId)
        self.navigationController?.pushViewController(result, animated: true)
    }
    
}
// MARK:- SetupDesign
extension SearchVC {
    func updateUI(){
        searchView.setup()
        getCategories()
        setupPicker()
        setupToolbar()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.nevServices)
        navigationController?.isNavigationBarHidden = true
        searchView.regionTextField.delegate = self
    }
    
}

// MARK: - PickerView Methods
extension SearchVC: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func setupPicker(){
        searchView.pickerView1.delegate = self
        searchView.pickerView2.delegate = self
        searchView.pickerView4.delegate = self
        searchView.specialistsTextFeild.inputView = searchView.pickerView1
        searchView.cityTextfield.inputView = searchView.pickerView2
        searchView.companiesTextField.inputView = searchView.pickerView4
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == searchView.pickerView1{
            searchView.setPickerCheck(special: true, city: false, region: false, company: false)
            return (viewModel.sendCategoriesData().specialties?.count) ?? 0
        }
        else if pickerView == searchView.pickerView2{
            searchView.pickerView3.delegate = self
            searchView.regionTextField.inputView = searchView.pickerView3
            searchView.setPickerCheck(special: false, city: true, region: false, company: false)
            return  (viewModel.sendCategoriesData().cities?.count) ?? 0
        }
        else if pickerView == searchView.pickerView3 {
            searchView.setPickerCheck(special: false, city: false, region: true, company: false)
            if let city = searchView.cityTextfield.text, city != "" {
                return (viewModel.sendCategoriesData().cities?[viewModel.sendCityId() - 1].regions?.count) ?? 0
            }
            else {
                searchView.pickerView3.isHidden = true
                return 0
            }
        }
        else if pickerView == searchView.pickerView4 {
            searchView.setPickerCheck(special: false, city: false, region: false, company: true)
            return (viewModel.sendCategoriesData().companies?.count) ?? 0
            
        }
        else {
            return 0
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == searchView.pickerView1{
            return viewModel.sendCategoriesData().specialties?[row].name
        }
        
        else if pickerView == searchView.pickerView2{
            return viewModel.sendCategoriesData().cities?[row].name
        }
        else if pickerView == searchView.pickerView3 {
            return viewModel.sendCategoriesData().cities?[viewModel.sendCityId() - 1].regions?[row].name
        }
        else if pickerView == searchView.pickerView4 {
            return viewModel.sendCategoriesData().companies?[row].name
        }
        else {
            return ""
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == searchView.pickerView1{
            searchView.specialityId = viewModel.sendCategoriesData().specialties![row].id
            searchView.specialistsTextFeild.text = viewModel.sendCategoriesData().specialties?[row].name
        }
        else if pickerView == searchView.pickerView2{
            
            searchView.cityTextfield.text = viewModel.sendCategoriesData().cities?[row].name
            searchView.cityID = viewModel.sendCategoriesData().cities?[row].id ?? 0
            viewModel.getCityId(id: viewModel.sendCategoriesData().cities?[row].id ?? 0)
            searchView.regionTextField.text = ""
            
        }
        else if pickerView == searchView.pickerView3 {
            searchView.regionId = viewModel.sendCategoriesData().cities?[viewModel.sendCityId() - 1].regions?[row].id as! Int
            searchView.regionTextField.text = viewModel.sendCategoriesData().cities?[viewModel.sendCityId() - 1].regions?[row].name
        }
        
        else if pickerView == searchView.pickerView4 {
            searchView.companiesTextField.text = viewModel.sendCategoriesData().companies?[row].name
        }
    }
}

// MARK: - ToolBar Methods
extension SearchVC{
    
    func setupToolbar(){
        searchView.toolBar.barStyle = UIBarStyle.default
        searchView.toolBar.isTranslucent = true
        searchView.toolBar.tintColor = .black
        searchView.toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        searchView.toolBar.setItems([leftSpace,doneButton], animated: false)
        
        searchView.toolBar.isUserInteractionEnabled = true
        searchView.specialistsTextFeild.inputAccessoryView = searchView.toolBar
        searchView.cityTextfield.inputAccessoryView = searchView.toolBar
        searchView.regionTextField.inputAccessoryView = searchView.toolBar
        searchView.companiesTextField.inputAccessoryView = searchView.toolBar
        
    }
    @objc func donePicker() {
        
        if searchView.specialCheck == true {
            if searchView.specialistsTextFeild.text == "" {
                let row = searchView.pickerView1.selectedRow(inComponent: 0)
                searchView.specialityId = viewModel.sendCategoriesData().specialties![row].id
                searchView.specialistsTextFeild.text = viewModel.sendCategoriesData().specialties?[row].name
                searchView.specialistsTextFeild.resignFirstResponder()
            }
            else {
                searchView.specialistsTextFeild.resignFirstResponder()
            }
        }
        else if searchView.cityCheck == true {
            if searchView.cityTextfield.text == "" {
                let row = searchView.pickerView2.selectedRow(inComponent: 0)
                searchView.cityTextfield.text = viewModel.sendCategoriesData().cities?[row].name
                searchView.cityID = viewModel.sendCategoriesData().cities?[row].id ?? 0
                viewModel.getCityId(id: viewModel.sendCategoriesData().cities?[row].id ?? 0)
                searchView.cityTextfield.resignFirstResponder()
            }
            else {
                searchView.cityTextfield.resignFirstResponder()
            }
        }
        
        else if searchView.regionCheck == true {
            if searchView.regionTextField.text == "" {
                let row = searchView.pickerView3.selectedRow(inComponent: 0)
                searchView.regionId = viewModel.sendCategoriesData().cities?[searchView.cityID - 1].regions?[row].id as! Int
                searchView.regionTextField.text = viewModel.sendCategoriesData().cities?[searchView.cityID - 1].regions?[row].name
                searchView.regionTextField.resignFirstResponder()
            }
            else {
                searchView.specialistsTextFeild.resignFirstResponder()
            }
        }
        
        else if searchView.companyCheck == true {
            if searchView.companiesTextField.text == "" {
                let row = searchView.pickerView4.selectedRow(inComponent: 0)
                searchView.companiesTextField.text = viewModel.sendCategoriesData().companies?[row].name
                searchView.companiesTextField.resignFirstResponder()
            }
            else {
                searchView.cityTextfield.resignFirstResponder()
            }
        }
        searchView.specialistsTextFeild.resignFirstResponder()
        searchView.cityTextfield.resignFirstResponder()
        searchView.regionTextField.resignFirstResponder()
        searchView.companiesTextField.resignFirstResponder()
    }
    
}
