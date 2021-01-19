//
//  FavouriteVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/16/20.
//

import UIKit
protocol FavouriteVCProtocol: class {
    func showLoader()
    func hideLoader()
    func getTableView() -> UITableView
    func showAlert(title: String , massage: String)
}
class FavouriteVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet var favouriteView: FavouriteView!
    
    private var favoriteViewModel: FavouriteViewModal!
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favouriteView.count = 1
        self.favouriteView.fetch = false
        favoriteViewModel.getDocsResponse(deletion: true, page: favouriteView.count) { [self] in
            self.favouriteView.getfavDoc(count: self.favoriteViewModel.getAllFavDoctors().count)
            self.favouriteView.favouriteTableView.reloadData()
        }
    }
    
    //MARK:- navBarButtons
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    @objc func backBtnTapped(){
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- CreateVC
    class func create() -> FavouriteVC {
        let favVC: FavouriteVC = UIViewController.create(storyboardName: Storyboards.Favourite, identifier: ViewControllers.FavouriteVC)
        favVC.favoriteViewModel = FavouriteViewModal(view: favVC)
        return favVC
    }
    
    //MARK:- deleteFavouriteDoctor
    @objc func deletePressed(sender: UIButton){
        
        let items = favoriteViewModel.sendDoctorData(row: favouriteView.doctorIndex)
        favoriteViewModel.deleteFavDocs(id: items.id) {
            self.favouriteView.count = 1
            self.favouriteView.fetch = false
            self.favoriteViewModel.getDocsResponse(deletion: true,page: self.favouriteView.count) { [self] in
                self.favouriteView.getfavDoc(count: self.favoriteViewModel.getAllFavDoctors().count)
                self.favouriteView.favouriteTableView.reloadData()
            }
        }
    }
}
//MARK:- tableViewDelegate&DataSource
extension FavouriteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteViewModel.getAllFavDoctors().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: L10n.cellName, for: indexPath) as! FavouriteTableViewCell
        cell.configureCell(favDoctor: favoriteViewModel.sendDoctorData(row: indexPath.row))
        cell.delegate = self
        cell.deleteButton.addTarget(self, action: #selector(deletePressed(sender:)), for: .touchUpInside)
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if position > contentHeight - scrollView.frame.height {
            if !favouriteView.fetch {
                beginFetch()
                
            }
        }
    }
    func beginFetch(){
        favouriteView.fetch = true
        
        if favouriteView.count < favoriteViewModel.getTotalPages() {
            favouriteView.count += 1
            favoriteViewModel.getDocsResponse(deletion: false, page: favouriteView.count) {
                self.favouriteView.favouriteTableView.reloadData()
                self.favouriteView.fetch = false
            }
        }
    }
}
//MARK:- designFavouritePage
extension FavouriteVC {
    func setDesign(){
        favouriteView.updateUI()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.favourite)
        
        navigationController?.isNavigationBarHidden = true
        
    }
}

extension FavouriteVC: FavouriteVCProtocol {
    func getTableView() -> UITableView {
        return favouriteView.favouriteTableView
    }
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader() {
        self.view.hideLoader()
    }
    func showAlert(title: String , massage: String) {
        let alertPayload = AlertPayload(img: Asset.errorBook.image,message: massage) {
            AppDelegate.shared().switchToHomwState()
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
}
//MARK:- deleteDelegtion
extension FavouriteVC: addDeleteCellDelegate {
    func btnDeleteTapped(cell: FavouriteTableViewCell) {
        let indexPath = self.favouriteView.favouriteTableView.indexPath(for: cell)
        favouriteView.doctorIndex = indexPath!.row
    }
    
    
}















//        let viewSeparatorLine = UIView(frame:CGRect(x: 0, y: (cell.contentView.frame.size.height) - 2.0, width: (cell.contentView.frame.size.width) + 12, height: 2))
//           viewSeparatorLine.backgroundColor = .white
//        cell.contentView.addSubview(viewSeparatorLine)
