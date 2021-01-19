//
//  CustomTextField.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/13/20.
//

import UIKit

class CustomTextField: UITextField {
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
       @IBInspectable var gapPadding: CGFloat = 8
       
       private var textPadding: UIEdgeInsets {
           let p: CGFloat = leftPadding + gapPadding + (leftView?.frame.width ?? 0)
           return UIEdgeInsets(top: 0, left: p, bottom: -10, right: 5)
       }
       
       override open func textRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: textPadding)
       }
       
       override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: textPadding)
       }
       
       override open func editingRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: textPadding)
       }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    func setBottomLine(borderColor: UIColor, width: Double) {
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height + 1), width: width , height: 1)
        borderLine.backgroundColor = borderColor
        
        self.addSubview(borderLine)
    }
    
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y:0, width: 32, height: 36))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
         
    }
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 4, width: 32, height: 36))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 0, y: 0, width: 32, height: 36))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
