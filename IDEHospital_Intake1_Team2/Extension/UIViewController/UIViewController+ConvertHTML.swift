//
//  UIViewController+ConvertHTML.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/25/20.
//

import UIKit

extension UIViewController {
    func conv (str: String) -> NSAttributedString{
        let data = Data(str.utf8)
        let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        return attributedString!
        
    }
}
