//
//  VoucherVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit
// MARK:- Protocols
protocol VoucherVCProtocol: class {
    func showAlert(img: UIImage, massage: String)
    func sendIsOnCode()->Bool
    func sendIsOnName()->Bool
    func sendCode()->String
    func sendName()->String
    func switchToBook(userApp: userAppoint)
}
class VoucherVC: UIViewController {
    
    // MARK:- outlets
    @IBOutlet var voucherView: VoucherView!
    private var voucherViewModal: VoucherViewModal!
    var docName = ""
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        voucherView.updateUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        voucherView.overlayView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender:UITapGestureRecognizer){
        if !voucherView.overlayView.isHidden {
            self.dismiss(animated: true, completion: nil)
        }
    }
    //MARK:- CreateVC
    class func create(id: Int, appoint: Int) -> VoucherVC {
        let vouchVC: VoucherVC = UIViewController.create(storyboardName: Storyboards.voucher, identifier: ViewControllers.VoucherVC)
        vouchVC.voucherViewModal = VoucherViewModal(view: vouchVC, id: id, appoint: appoint)
        return vouchVC
    }
    
    // MARK:- switchesPressed
    @IBAction func voucherCodePressed(_ sender: UISwitch) {
        voucherView.setSwitch(sender: sender)
    }
    
    
    @IBAction func personNameSwitchPressed(_ sender: UISwitch) {
        voucherView.setPSwitch(sender: sender)
    }
    // MARK:- ContinuePressed
    @IBAction func continuePressed(_ sender: UIButton) {
        self.voucherViewModal.continuePressed()
    }
    
}

extension VoucherVC: VoucherVCProtocol {
    func switchToBook(userApp: userAppoint) {
        let book = bookAppointmentVC.create(data: userApp)
        let presenting = self.presentingViewController
        book.modalPresentationStyle = .overCurrentContext
        book.user = userApp
        book.docName = docName
        self.dismiss(animated: true, completion: nil)
        presenting?.present(book, animated: true, completion: nil)
    }
    
    func sendIsOnCode() -> Bool {
        return voucherView.isOnCode
    }
    
    func sendIsOnName() -> Bool {
        return voucherView.isOnName
    }
    
    func sendCode() -> String {
        return voucherView.codeTF.text ?? ""
    }
    
    func sendName() -> String {
        return voucherView.personNameTF.text ?? ""
    }
    
    func showAlert(img: UIImage, massage: String) {
        let alertPayload = AlertPayload(img:img,message: massage) {
            //self.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: self)
    }
}
