//
//  SearchResultVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/21/20.
//

import UIKit

// MARK:- Protocols
protocol SearchResultVCProtocols: class {
    func hideLoader()
    func showLoader()
    func returnTableView()
    func sendSortText() -> String
    func emptyDataMessage()
}

class SearchResultVC: UIViewController {
    
    //MARK:- outlets
    @IBOutlet var resultView: SearchResultView!
    
    // MARK: - Properties
    private var viewModel : ResultViewModelProtocols!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        setupPicker()
        viewModel.getResult()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // MARK:- Public Methods
    class func create(mainId: Int
                      ,specialtyId: Int,cityId: Int,regionId: Int) -> SearchResultVC {
        let searchResult: SearchResultVC = UIViewController.create(storyboardName: L10n.search, identifier: ViewControllers.searchResultVC)
        searchResult.viewModel = ResultViewModel(view: searchResult, mainId: mainId,specialtyId: specialtyId, cityId: cityId, regionId: regionId)
        return searchResult
    }
    
    // MARK:- Button Methods
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    @objc func favouritePressed(sender: UIButton){
        
        if UserDefaultsManager.shared().token == nil {
            let alertPayload = AlertPayload(img:Asset.errorBook.image,message: L10n.unRegister) {
                self.dismiss(animated: true, completion: nil)
            }
            Utils.showAlert(payload: alertPayload, parentViewController: self)
        }
        else {
            let items = viewModel.getItem(row: resultView.doctorIndex)
            sender.setImage(nil, for: .normal)
            sender.setImage(Asset.heart2.image, for: .normal)
            viewModel.addfav(id: items.id)
        }
    }
    @objc func backBtnTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func profilePressed(sender: UIButton){
        let docProfile = DoctorProfileVC.create(id: viewModel.getItem(row: resultView.doctorIndex).id)
        docProfile.isFav = viewModel.getItem(row: resultView.doctorIndex).isFavorited
        self.navigationController?.pushViewController(docProfile, animated: true)
    }
    
}

// MARK:- TableView Methods
extension SearchResultVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getSearchItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.resultCell, for: indexPath) as! ResultCell
        cell.configureCell(resultDoctor: viewModel.getItem(row: indexPath.row))
        cell.delegate = self
        cell.favouriteBtn.addTarget(self, action: #selector(favouritePressed(sender:)), for: .touchUpInside)
        cell.bookNowBtn.addTarget(self, action: #selector(profilePressed(sender:)), for: .touchUpInside)
        return cell
    }
    
    func setDesign(){
        resultView.updateUI()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.nevResult)
        resultView.resultTableView.separatorStyle = .none
        navigationController?.isNavigationBarHidden = true
        resultView.resultTableView.rowHeight = UITableView.automaticDimension
        resultView.resultTableView.estimatedRowHeight = 88
    }
}

// MARK:- Cell Methods
extension SearchResultVC: favoriteCellDelegate{
    func btnTapped(cell: ResultCell) {
        let indexPath = self.resultView.resultTableView.indexPath(for: cell)
        resultView.doctorIndex = indexPath!.row
    }
}
extension SearchResultVC: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return resultView.sortArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return resultView.sortArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultView.sortTextField.text = resultView.sortArray[row]
        viewModel.getResult()
    }
    
    func setupPicker(){
        resultView.sortPickerView.delegate = self
        resultView.sortTextField.inputView = resultView.sortPickerView
    }
    
}
// MARK: - Implement Protocols
extension SearchResultVC: SearchResultVCProtocols{
    func sendSortText() -> String{
        return resultView.sortTextField.text ?? "rating"
    }
    func returnTableView() {
        return resultView.resultTableView.reloadData()
    }
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    func emptyDataMessage() {
        self.view.setupMessageLabel(title: "No Data Find")
    }
    
}
