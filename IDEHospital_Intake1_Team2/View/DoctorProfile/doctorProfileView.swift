//
//  doctorProfileView.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/1/21.
//

import UIKit
import Cosmos
class DoctorProfileView: UIView {
    //MARK:- outlets
    @IBOutlet weak var appointCollection: UICollectionView!
    @IBOutlet weak var heightOfCollection: NSLayoutConstraint!
    
    @IBOutlet weak var bookDesign: UIButton!
    @IBOutlet weak var doctorprofileReview: UIView!
    
    @IBOutlet weak var doctorProfileView: UIView!
    @IBOutlet weak var doctorReviewView: UIView!
    @IBOutlet weak var ReviewLabel: UILabel!
    
    @IBOutlet weak var doctorProfileLabel: UILabel!
    @IBOutlet weak var numReviewsLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var secBioLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var waitLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var bioImage: UIImageView!
    @IBOutlet weak var secBioImage: UIImageView!
    @IBOutlet weak var addressImage: UIImageView!
    
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var waitImage: UIImageView!
    @IBOutlet weak var feeImage: UIImageView!
    @IBOutlet weak var companyImage: UIImageView!
    
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorRate: CosmosView!
    
    @IBOutlet weak var doctorReview: UILabel!
    @IBOutlet weak var doctorSpeciality: UILabel!
    
    @IBOutlet weak var dateLabel: UIView!
    @IBOutlet weak var dayAppointmentLabel: UILabel!
    @IBOutlet weak var doctorProfileDesign: UIButton!
    @IBOutlet weak var viewMapDesign: UIButton!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tabReviewDesign: UIButton!
    @IBOutlet weak var mainReviewView: UIView!
    @IBOutlet weak var reviewTableView: UITableView!
    
    @IBOutlet weak var favDesign: UIButton!
    @IBOutlet weak var noAppointLabel: UILabel!
    
    
    var count = 0
    var lat: Double = 0.0
    var lng: Double = 0.0
    var dateArray = [String]()
    var companyString = ""
    var cellHeight:CGFloat = 0.0
    var indx = 0
    var indexArray = [Int]()
    var bookArray = [Bool]()
    
    //MARK:- updateUI
    func updateUI() {
        assignFonts()
        assignColors()
        assignImages()
        underLineButton()
        updateViews()
    }
    
    func assignFonts(){
        doctorSpeciality.font = FontFamily.PTSans.regular.font(size: 12)
        doctorProfileLabel.font = FontFamily.PTSans.bold.font(size: 15)
        ReviewLabel.font = FontFamily.PTSans.bold.font(size: 15)
        numReviewsLabel.font = FontFamily.PTSans.bold.font(size: 15)
        viewMapDesign.titleLabel?.font = FontFamily.PTSans.regular.font(size: 13)
    }
    
    func assignColors(){
        doctorProfileLabel.textColor = .black
        doctorProfileView.backgroundColor = .white
        doctorReviewView.backgroundColor = UIColor(named: ColorName.veryLightPink)
        ReviewLabel.textColor = .black
        numReviewsLabel.textColor = UIColor(named: ColorName.purble)
        bookDesign.backgroundColor = UIColor(named: ColorName.disBook)
        bookDesign.titleLabel?.textColor = UIColor(named: ColorName.disBookLabel)
        bookDesign.layer.cornerRadius = 8
        bookDesign.layer.masksToBounds = true
        viewMapDesign.titleLabel?.textColor = UIColor(named: ColorName.purble)
        
        
        bookDesign.setTitleColor(UIColor(named: ColorName.white), for: .normal)
        bookDesign.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
    }
    
    func assignImages(){
        mapImage.image = Asset.pinn.image
        favDesign.setImage(Asset.heart.image, for: .normal)
        setupImages(imageView: doctorImage)
        bioImage.image = Asset.groupHeart.image
        secBioImage.image = Asset.doclife.image
        addressImage.image = Asset.docpin.image
        waitImage.image = Asset.docClock.image
        feeImage.image = Asset.docFee.image
        companyImage.image = Asset.care.image
    }
    func underLineButton(){
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: FontFamily.PTSans.bold.font(size: 10),
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "TAB REVIEW",attributes:yourAttributes)
        tabReviewDesign.setAttributedTitle(attributeString, for: .normal)
    }
    
    func setNext(appoint: Int){
        if count == appoint  {
            count = 0
        }
    }
    
    func setPrev(appoint: Int){
        
        if count == -1 {
            count = appoint
        }
    }
    
    func updateViews(){
        
        reviewTableView.rowHeight = UITableView.automaticDimension
        reviewTableView.estimatedRowHeight = 88
        reviewTableView.separatorStyle = .none
        cellHeight = 25;
        heightOfCollection.constant = (cellHeight * 2) + 15;
        appointCollection.reloadData();
        appointCollection.clipsToBounds = true;
        noAppointLabel.isHidden = true
        //        bookDesign.setButtonDesign(title: L10n.book)
        doctorprofileReview.setCornerRadius()
        doctorProfileLabel.text = L10n.docProf
        ReviewLabel.text = L10n.views
        doctorRate.settings.updateOnTouch = false
        doctorRate.settings.filledImage = Asset.rate.image
        doctorRate.settings.emptyImage = Asset.unfill.image
        doctorRate.settings.fillMode = .precise
        bookDesign.isEnabled = false
        mainReviewView.isHidden = true
        
    }
    func updateViewsArray(docAppointment: [String] ,detailsAppoint: [[String]],allAppoint: [[Int]], allBook: [[Bool]]){
        dayAppointmentLabel.text = docAppointment[count]
        dateArray = detailsAppoint[count]
        indexArray = allAppoint[count]
        bookArray = allBook[count]
        appointCollection.reloadData()
    }
    
    func nextPress(){
        bookDesign.backgroundColor = UIColor(named: ColorName.disBook)
        bookDesign.titleLabel?.textColor = UIColor(named: ColorName.disBookLabel)
        count += 1
    }
    
    func prevPress(){
        bookDesign.backgroundColor = UIColor(named: ColorName.disBook)
        bookDesign.titleLabel?.textColor = UIColor(named: ColorName.disBookLabel)
        count -= 1
    }
    
    func checkAppLabel(){
        if dateArray.count == 0 { self.noAppointLabel.isHidden = false }
        else { self.noAppointLabel.isHidden = true }
    }
    
    func setViewData(doctorData: doctorItem){
        doctorImage.kf.setImage(with: URL(string: doctorData.image!))
        doctorReview.text = "\(doctorData.reviewsCount ?? 0) \(L10n.views)"
        doctorName.text = doctorData.name!
        doctorRate.rating = Double(doctorData.rating!)
        doctorSpeciality.text = doctorData.bio
        bioLabel.text = doctorData.specialty
        secBioLabel.text = doctorData.secondBio
        addressLabel.text = doctorData.address
        waitLabel.text = "\(L10n.wating) \(doctorData.waitingTime ?? 0)\(L10n.min)"
        feeLabel.text = "\(L10n.fee)\(doctorData.fees ?? 0) \(L10n.egp)"
        
        for i in doctorData.companies! {
            self.companyString += "\(i),"
        }
        companyLabel.text = companyString
    }
    
    func disableBook(){
        bookDesign.isEnabled = false
        bookDesign.backgroundColor = UIColor(named: ColorName.disBook)
        bookDesign.titleLabel?.textColor = UIColor(named: ColorName.disBookLabel)
    }
    func enableBook(){
        bookDesign.isEnabled = true
        bookDesign.backgroundColor = UIColor(named: ColorName.commonButton)
        bookDesign.titleLabel?.textColor = .white
    }
    
    func didSelectCell(cell: DoctorProfileCollectionViewCell, index: Int) {
        indx = index
        if bookArray[indx] == true {
            cell.contentView.backgroundColor = UIColor(named: ColorName.disBook)
            disableBook()
        }
        else {
            cell.contentView.backgroundColor = UIColor(named: ColorName.commonButton)
            enableBook()
        }
    }
    func cellForRow(cell: DoctorProfileCollectionViewCell, index: Int){
        cell.appointLabel.text = dateArray[index]
        if bookArray[index] == true {
            cell.contentView.backgroundColor = UIColor(named: ColorName.disBook)
        }
    }
    
    func deSelectRow(cell: DoctorProfileCollectionViewCell, index: Int){
        indx = index
        if bookArray[indx] == true {
            cell.contentView.backgroundColor = UIColor(named: ColorName.disBook)
        }
    }
    
    func showProfilePressed(){
        scroll.isHidden = false
        mainReviewView.isHidden = true
        doctorReviewView.backgroundColor = UIColor(named: ColorName.veryLightPink)
        doctorProfileView.backgroundColor = .white
    }
    func showReviewPressed(){
        scroll.isHidden = true
        mainReviewView.isHidden = false
        doctorReviewView.backgroundColor = .white
        doctorProfileView.backgroundColor = UIColor(named: ColorName.veryLightPink)
    }
    
    
}
