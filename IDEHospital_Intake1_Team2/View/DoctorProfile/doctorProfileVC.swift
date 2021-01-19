//
//  doctorProfileVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/1/21.
//

import UIKit
import Kingfisher
import CoreLocation
import MapKit
protocol docVCProtocol: class {
    func showLoader()
    func hideLoader()
    func showAlert(title: String , massage: String)
    func switchUnRegister()
    func switchVoucher()
    func noFav()
    func fav()
}
class DoctorProfileVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    //MARK:- Outlets
    @IBOutlet var doctorView: DoctorProfileView!
    
    //MARK:- Variables
    private var doctorViewModal: DoctorProfileViewModal!
    private var locationManager = CLLocationManager()
    var isFav = false
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doctorView.updateUI()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.nevResult)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.layoutIfNeeded();
        updateUI()
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK:- NavBarButtons
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- choosingDateFunctions
    @IBAction func nextDatePressed(_ sender: UIButton) {
        doctorView.nextPress()
        doctorView.setNext(appoint: self.doctorViewModal.returnDetailsAppoints().count)
        self.doctorView.updateViewsArray(docAppointment: self.doctorViewModal.returnDocAppointment(), detailsAppoint: self.doctorViewModal.returnDetailsAppoints(), allAppoint: self.doctorViewModal.returnAllAppointment(), allBook: self.doctorViewModal.returnAllBookApp())
        
    }
    @IBAction func prevDatePressed(_ sender: UIButton) {
        doctorView.prevPress()
        doctorView.setPrev(appoint: self.doctorViewModal.returnDetailsAppoints().count - 1)
        
        self.doctorView.updateViewsArray(docAppointment: self.doctorViewModal.returnDocAppointment(), detailsAppoint: self.doctorViewModal.returnDetailsAppoints(), allAppoint: self.doctorViewModal.returnAllAppointment(), allBook: self.doctorViewModal.returnAllBookApp())
    }
    
    //MARK:- MapView
    @IBAction func mapPressed(_ sender: UIButton) {
        locationManager.requestAlwaysAuthorization()
        
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: doctorView.lat, longitude: doctorView.lng)))
        source.name = L10n.source
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: doctorViewModal.fetchDoctor().data.lat ?? 0.0, longitude: doctorViewModal.fetchDoctor().data.lng ?? 0.0)))
        destination.name = L10n.destination
        MKMapItem.openMaps(with: [source, destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    
    //MARK:- ShowDoctorProfile
    @IBAction func showProfilePressed(_ sender: UIButton) {
        doctorView.showProfilePressed()
    }
    //MARK:- ShowDoctorReview
    @IBAction func showReviewPressed(_ sender: UIButton) {
        doctorView.showReviewPressed()
    }
    
    @IBAction func bookPressed(_ sender: UIButton) {
        doctorViewModal.setBook()
    }
    
    //MARK:- FavoriteDoctor
    @IBAction func favPressed(_ sender: UIButton) {
        doctorViewModal.setFav()
    }
    
    @IBAction func tabReview(_ sender: UIButton) {
        let review = AddCommentVC.create(id: doctorViewModal.fetchDoctor().data.id!)
        review.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(review, animated: true)
    }
    
    
    //MARK:- CreateVC
    class func create(id: Int) -> DoctorProfileVC {
        let docVC: DoctorProfileVC = UIViewController.create(storyboardName: Storyboards.bookDoctor, identifier: ViewControllers.DoctorProfileVC)
        docVC.doctorViewModal = DoctorProfileViewModal(view: docVC, id: id)
        UserDefaultsManager.shared().docID = id
        return docVC
    }
    
    // MARK: - Collection View Delegate Methods.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 20), height: doctorView.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        doctorView.checkAppLabel()
        return doctorView.dateArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! DoctorProfileCollectionViewCell
        doctorView.cellForRow(cell: cell, index: indexPath.row)
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = doctorView.appointCollection.cellForItem(at: indexPath) as! DoctorProfileCollectionViewCell
        doctorView.didSelectCell(cell: cell, index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = doctorView.appointCollection.cellForItem(at: indexPath) as! DoctorProfileCollectionViewCell
        doctorView.deSelectRow(cell: cell, index: indexPath.row)
    }
    
}
extension DoctorProfileVC: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View Delegate Methods.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorViewModal.returnReviews().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = doctorView.reviewTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReviewTableViewCell
        cell.configureCell(review: doctorViewModal.returnReviews()[indexPath.row])
        return cell
    }
    
    
}

extension DoctorProfileVC: docVCProtocol {
    func noFav() {
        let alertPayload = AlertPayload(img:Asset.errorBook.image,message: L10n.unRegister) {
            self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
    
    func fav() {
        doctorViewModal.addfav(id: doctorViewModal.fetchDoctor().data.id!)
    }
    
    func switchUnRegister() {
        let unRegister = RegisterVC.create(id: doctorViewModal.fetchDoctor().data.id!, appoint: doctorView.indexArray[doctorView.indx])
        unRegister.modalPresentationStyle = .overFullScreen
        present(unRegister, animated: false, completion: nil)
    }
    
    func switchVoucher() {
        let voucher = VoucherVC.create(id: doctorViewModal.fetchDoctor().data.id!, appoint: doctorView.indexArray[doctorView.indx])
        voucher.docName = doctorViewModal.fetchDoctor().data.name!
        voucher.modalPresentationStyle = .overFullScreen
        self.present(voucher, animated: true, completion: nil)
    }
    
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader() {
        self.view.hideLoader()
    }
    func showAlert(title: String , massage: String) {
        print("")
    }
}

extension DoctorProfileVC: CLLocationManagerDelegate {
    
    // MARK: - CurrentLocation.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        doctorView.lat = locations.last!.coordinate.latitude
        doctorView.lng = locations.last!.coordinate.longitude
        manager.stopUpdatingLocation()
    }
}
extension DoctorProfileVC {
    func updateUI(){
        if isFav == true {
            doctorView.favDesign.setImage(Asset.heart2.image, for: .normal)
        }
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        doctorViewModal.getDoctorData { [self] in
            self.doctorView.setViewData(doctorData: self.doctorViewModal.fetchDoctor().data)
        }
        
        doctorViewModal.getDocApp {
            self.doctorView.updateViewsArray(docAppointment: self.doctorViewModal.returnDocAppointment(), detailsAppoint: self.doctorViewModal.returnDetailsAppoints(), allAppoint: self.doctorViewModal.returnAllAppointment(), allBook: self.doctorViewModal.returnAllBookApp())
        }
        
        doctorViewModal.fetchDocReview {
            self.doctorView.reviewTableView.reloadData()
        }
    }
}

