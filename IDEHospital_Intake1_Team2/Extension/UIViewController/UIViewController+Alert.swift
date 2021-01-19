//
//  UIViewController+Alert.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/7/20.
//

import UIKit

extension UIViewController {
// MARK:- Public Alert Method
    func showAlert(title: String,massage: String, present : UIViewController,titleBtn: String, completion: @escaping()->Void){
        let  alertError = UIAlertController(title: title , message: massage , preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: titleBtn, style: .default, handler: { action in
            completion()
        }))
      
        alertError.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present.self.present(alertError, animated: true)
    }
}
