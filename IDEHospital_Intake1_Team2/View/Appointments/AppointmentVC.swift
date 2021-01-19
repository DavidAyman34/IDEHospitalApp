//
//  AppointmentVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import UIKit
import CoreLocation
import MapKit

class AppointmentVC: UIViewController, CLLocationManagerDelegate {
    //MARK:- outlets
    @IBOutlet var appointmentView: AppointmentsView!
    private var appointmentViewModal: AppointmentViewModal!
    private var locationManager = CLLocationManager()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appointmentView.count = 1
        self.appointmentView.fetch = false
        appointmentViewModal.getUserAppointments(deletion: true, page: self.appointmentView.count){ [self] in
            self.appointmentView.getappDoc(count: self.appointmentViewModal.getAllAppointments().count)
            self.appointmentView.appointmentTableView.reloadData()
            
        }
    }
    //MARK:- navBarButtons
    @objc func settingBtnTapped(){
        let setting = SettingVC.create()
        setting.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(setting, animated: false)
    }
    
    @objc func backBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:- createVC
    class func create() -> AppointmentVC {
        let appointVC: AppointmentVC = UIViewController.create(storyboardName: Storyboards.Appointment, identifier: ViewControllers.AppointmentVC)
        appointVC.appointmentViewModal = AppointmentViewModal(view: appointVC)
        return appointVC
    }
    //MARK:- getCurrentLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        appointmentView.lat = locations.last!.coordinate.latitude
        appointmentView.lng = locations.last!.coordinate.longitude
        manager.stopUpdatingLocation()
    }
    //MARK:- deleteAppointment
    @objc func deletePressed(sender: UIButton) {
        
        let OK = AlertButton1 {
            
            let appoint = self.appointmentViewModal.getAppointment(row: self.appointmentView.doctorIndex)
            self.appointmentViewModal.deleteAppointments(id: appoint.id) {
                self.appointmentView.count = 1
                self.appointmentView.fetch = false
                self.appointmentViewModal.getUserAppointments(deletion: true, page: self.appointmentView.count) {
                    self.appointmentView.getappDoc(count: self.appointmentViewModal.getAllAppointments().count)
                    self.appointmentView.appointmentTableView.reloadData()
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
        let Cancel = AlertButton1 {
            self.dismiss(animated: true, completion: nil)
        }
        let alertPayload = AlertPayload1(message: L10n.deleteAppoint,  buttons: [OK, Cancel])
        
        Utils.showAlert1(payload: alertPayload, parentViewController: self);
    }
    //MARK:- showDirectionOnMap
    @objc func mapPressed(sender: UIButton) {
        let appoint = appointmentViewModal.getAppointment(row: appointmentView.doctorIndex)
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: appointmentView.lat, longitude: appointmentView.lng)))
        source.name = L10n.source
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: appoint.doctor.lat ?? 0.0, longitude: appoint.doctor.lng ?? 0.0)))
        destination.name = L10n.destination
        MKMapItem.openMaps(with: [source, destination], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
        
    }
}

extension AppointmentVC: HomeVCProtocol {
    func showLoader() {
        self.view.showLoader()
    }
    func hideLoader(){
        self.view.hideLoader()
    }
    func showAlert(title: String , massage: String) {
        let alertPayload = AlertPayload(img: Asset.errorBook.image,message: massage) {
            AppDelegate.shared().switchToHomwState()
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
}
//MARK:- tableViewDelegate&DataSource
extension AppointmentVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointmentViewModal.getAllAppointments().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appointmentView.appointmentTableView.dequeueReusableCell(withIdentifier: L10n.cellName, for: indexPath) as! AppointmentTableViewCell
        cell.configureCell(appointment: appointmentViewModal.getAppointment(row: indexPath.row))
        cell.delegate = self
        cell.deleteButton.addTarget(self, action: #selector(deletePressed(sender:)), for: .touchUpInside)
        cell.viewOnMap.addTarget(self, action: #selector(mapPressed(sender:)), for: .touchUpInside)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if position > contentHeight - scrollView.frame.height {
            if !appointmentView.fetch {
                beginFetch()
            }
        }
    }
    
    func beginFetch(){
        appointmentView.fetch = true
        if appointmentView.count < appointmentViewModal.getTotalPages() {
            appointmentView.count += 1
            appointmentViewModal.getUserAppointments(deletion: false, page: appointmentView.count) {
                self.appointmentView.appointmentTableView.reloadData()
                self.appointmentView.fetch = false
            }
        }
    }
}
//MARK:- deleteDelegtion
extension AppointmentVC: appointDeleteCellDelegate {
    func btnDeleteTapped(cell: AppointmentTableViewCell) {
        let indexPath = self.appointmentView.appointmentTableView.indexPath(for: cell)
        appointmentView.doctorIndex = indexPath!.row
    }
}
//MARK:- designAppointmentPage
extension AppointmentVC {
    func updateDesign(){
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        appointmentView.updateUI()
        setupNavigation(view: self, settingAcion: #selector(settingBtnTapped), backAcion:  #selector(backBtnTapped), title: L10n.appointment)
        
        navigationController?.isNavigationBarHidden = true
       
    }
}
