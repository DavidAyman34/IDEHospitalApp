//
//  cancelAppointmentVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit
struct AlertButton1 {
    var action: (() -> Swift.Void)? = nil;
    
}

struct AlertPayload1 {
    var message: String!;
    var buttons: [AlertButton1]!;
    
}
class cancelAppointmentVC: UIViewController {
    var payload: AlertPayload1!;
    
    // MARK:- outlets
    @IBOutlet var cancelAppointment: CancelAppointmentView!
    
    @IBOutlet weak var msgLabel: UILabel!
    
    var receiveUser = userAppoint()
    var presenting = UIViewController()
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenting = self.presentingViewController!
        msgLabel.text = payload.message;
        cancelAppointment.updateUI()
    }
    //MARK:- CreateVC
    class func create() -> cancelAppointmentVC {
        let cancelVC: cancelAppointmentVC = UIViewController.create(storyboardName: Storyboards.CancelAppointment, identifier: ViewControllers.cancelAppointmentVC)
        return cancelVC
    }
    
    
    // MARK:- yesPressed
    @IBAction func yesPressed(_ sender: UIButton) {
        parent?.dismiss(animated: false, completion: nil);
        payload.buttons.first?.action?();
    }
    // MARK:- No Pressed
    @IBAction func noPressed(_ sender: UIButton) {
        parent?.dismiss(animated: false, completion: nil);
        payload.buttons[1].action?();
    }
}
