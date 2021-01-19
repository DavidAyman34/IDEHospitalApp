//
//  HomeView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/8/20.
//

import UIKit

class HomeView: UIView, UINavigationBarDelegate {

    //MARK:- Outlets
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var headerLabel: UILabel!

    //MARK:- humanMedicine
    @IBOutlet weak var humanMedicineImage: UIImageView!
    @IBOutlet weak var humanMedicineLabel: UILabel!
    @IBOutlet weak var humanMedicineView: UIView!
    
    //MARK:- MRI
    @IBOutlet weak var mriView: UIView!
    @IBOutlet weak var mriImage: UIImageView!
    @IBOutlet weak var mriLabel: UILabel!
    
    //MARK:- Nurse
    @IBOutlet weak var homeNurseView: UIView!
    @IBOutlet weak var nurseLabel: UILabel!
    @IBOutlet weak var nurseImage: UIImageView!
    
    //MARK:- Veternary
    @IBOutlet weak var veternaryImage: UIImageView!
    @IBOutlet weak var veterinaryView: UIView!
    @IBOutlet weak var veternaryLabel: UILabel!
    
     func updateUI(){
         setupImages()
         setNavBar()
         updateViews()
     }
    // MARK:- setViews
    func setHomeView(categoryInfo: [MainCategory]){
        
        humanMedicineView.backgroundColor = UIColor(hexString: categoryInfo[0].color!)
        humanMedicineLabel.setuplabel(text: categoryInfo[0].name!, font: FontFamily.PTSans.bold.font(size: 15))
        humanMedicineImage.kf.setImage(with: URL(string: categoryInfo[0].image!))
        print(categoryInfo[0].image!)
        
        mriView.backgroundColor = UIColor(hexString: categoryInfo[1].color!)
        mriLabel.setuplabel(text: categoryInfo[1].name!, font: FontFamily.PTSans.bold.font(size: 15))
        mriImage.kf.setImage(with: URL(string: categoryInfo[1].image!))
        
        veterinaryView.backgroundColor = UIColor(hexString: categoryInfo[3].color!)
        veternaryLabel.setuplabel(text: categoryInfo[3].name!, font: FontFamily.PTSans.bold.font(size: 15))
        veternaryImage.kf.setImage(with: URL(string: categoryInfo[3].image!))
        
        homeNurseView.backgroundColor = UIColor(hexString: categoryInfo[2].color!)
        nurseLabel.setuplabel(text: categoryInfo[2].name!, font: FontFamily.PTSans.bold.font(size: 15))
        nurseImage.kf.setImage(with: URL(string: categoryInfo[2].image!))
        
        headerLabel.setuplabel(text: L10n.mainLabel, font: FontFamily.PTSans.bold.font(size: 20))
    }
    
     func updateViews(){
         humanMedicineView.setupViews(radius: 8)
         mriView.setupViews(radius: 8)
         homeNurseView.setupViews(radius: 8)
         veterinaryView.setupViews(radius: 8)
         activityView.setupViews(radius: 16)
     }
     
     func setupImages(){
         backgroundImage.image = Asset.component22.image
         logoImage.image = Asset.logo1.image
     }
     
     func setNavBar(){
         let window = UIApplication.shared.windows[0]
         let topPadding = window.safeAreaInsets.top
         let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: topPadding, width: self.frame.size.width, height: 47))

         navigationBar.delegate = self
         navigationBar.backgroundColor = UIColor.clear
         navigationBar.barTintColor = UIColor(named: ColorName.veryLightPink)

         let navigationItem = UINavigationItem()
        navigationItem.title = L10n.navLabel

         navigationBar.titleTextAttributes =
         [NSAttributedString.Key.foregroundColor: UIColor.white,
          NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 20)]

         navigationBar.items = [navigationItem]
         self.addSubview(navigationBar)
     }
    
    
}

 
