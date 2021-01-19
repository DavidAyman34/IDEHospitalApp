//
//  UIViewControllers+UIView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/8/20.
//

import UIKit
extension UIView {
    func dropShadow(scale: Bool = true) {
        // MARK:- Public Shadow Method
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // MARK:- Public SetupViews Method
    func setupViews(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        
    }
    // MARK:- Public SetupViews Method
    func setupMessageLabel(title: String){
        let label = UILabel()
        label.text = title
        label.numberOfLines = 0
        label.font = FontFamily.PTSans.regular.font(size: 30)
        label.textAlignment = .center
        label.center = self.center
        label.sizeToFit()
        label.textColor = .black
        label.backgroundColor = UIColor.clear
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
   
        func showLoader() {
            let activityIndicator = setupActivityIndicator()
            activityIndicator.startAnimating()
            self.addSubview(activityIndicator)
        }
        
        func hideLoader() {
            if let activityIndicator = viewWithTag(333) {
                activityIndicator.removeFromSuperview()
            }
        }
        
        private func setupActivityIndicator() -> UIActivityIndicatorView {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.frame = self.bounds
            activityIndicator.color = .darkText
            activityIndicator.tintColor = .blue
            activityIndicator.center = self.center
            activityIndicator.style = .gray
            activityIndicator.tag = 333
            return activityIndicator
        }
    
    func setupImages(imageView: UIImageView){
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 1
    }
    func setCornerRadius(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 25
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // topRight, topLeft
    }
    func convertDate(time: Int) -> [String] {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = L10n.date
        let strDate = dateFormatter.string(from: date)
        let array = strDate.components(separatedBy: CharacterSet(charactersIn: "/"))
        return array
    }
    
    func setupNavigation(view: UIView, settingAcion: Selector?, backAcion: Selector?, title: String){
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: topPadding , width: self.frame.size.width, height: 47))
        
        self.addSubview(navBar)
        let navItem = UINavigationItem(title: title)
        navBar.barTintColor =  UIColor(named: ColorName.veryLightPink)
        navItem.rightBarButtonItem = UIBarButtonItem(image: Asset.settings.image, style: .done, target: view,  action: settingAcion)
        navItem.leftBarButtonItem = UIBarButtonItem(image: Asset.back2.image, style: .done, target: view,  action: backAcion)
        navItem.leftBarButtonItem?.tintColor = .darkGray
        navItem.rightBarButtonItem?.tintColor = .darkGray
        navBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 20)]
        
        
        navBar.setItems([navItem], animated: false)
        
        
    }
}
