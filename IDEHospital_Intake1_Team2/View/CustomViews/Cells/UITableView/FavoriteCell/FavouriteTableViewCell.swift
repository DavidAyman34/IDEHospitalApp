//
//  FavouriteTableViewCell.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import UIKit
import Cosmos
import Kingfisher
protocol addDeleteCellDelegate: AnyObject {
    func btnDeleteTapped(cell: FavouriteTableViewCell)
}
class FavouriteTableViewCell: UITableViewCell {
    //MARK:- outlets
    weak var delegate: addDeleteCellDelegate?
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorRate: CosmosView!
    @IBOutlet weak var doctorReviewCount: UILabel!
    
    @IBOutlet weak var doctorSpeciality: UILabel!
    @IBOutlet weak var doctorAddress: UILabel!
    @IBOutlet weak var doctorWaitingTime: UILabel!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var doctorViewProfile: UIButton!
    
    @IBOutlet weak var specialtyImage: UIImageView!
    
    @IBOutlet weak var addressImage: UIImageView!
    @IBOutlet weak var waitingImage: UIImageView!
    @IBOutlet weak var feeImage: UIImageView!
    @IBOutlet weak var headSpecial: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    //MARK:- cellData
    func configureCell(favDoctor: FavoriteItem) {
        
        doctorImage.kf.setImage(with: URL(string: favDoctor.image))
        doctorName.text = "\(favDoctor.name ?? "")"
        doctorRate.rating = Double(favDoctor.rating)
        doctorReviewCount.text = "\(favDoctor.reviewsCount) \(L10n.views)"
        doctorSpeciality.text = favDoctor.specialty
        doctorAddress.text = favDoctor.address
        doctorWaitingTime.text = "\(L10n.wating)\(favDoctor.waitingTime) \(L10n.min)"
        feesLabel.text = "\(L10n.fee)\(favDoctor.fees) \(L10n.egp)"
        headSpecial.text = favDoctor.specialty
    }
    //MARK:- deleteButton
    @IBAction func deletePressed(_ sender: Any) {
        delegate?.btnDeleteTapped(cell: self)
    }
    
}
//MARK:- updateCellUI
extension FavouriteTableViewCell {
    func updateUI(){
        doctorViewProfile.setButtonDesign(title: L10n.favouriteTitle)
        setupImages(imageView: doctorImage)
        doctorImage.layer.masksToBounds = true
        doctorRate.settings.updateOnTouch = false
        doctorRate.settings.filledImage = Asset.rate.image
        doctorRate.settings.emptyImage = Asset.unfill.image
        doctorRate.settings.fillMode = .precise
        specialtyImage.image = Asset.group1.image
        addressImage.image = Asset.pin.image
        waitingImage.image = Asset.clock.image
        feeImage.image = Asset.money3.image
        doctorName.font = FontFamily.PTSans.bold.font(size: 15)
        doctorReviewCount.font = FontFamily.PTSans.regular.font(size: 12)
        doctorSpeciality.font = FontFamily.PTSans.bold.font(size: 12)
        doctorAddress.font = FontFamily.PTSans.bold.font(size: 12)
        doctorWaitingTime.font = FontFamily.PTSans.bold.font(size: 12)
        feesLabel.font = FontFamily.PTSans.bold.font(size: 12)
        headSpecial.font = FontFamily.PTSans.bold.font(size: 15)
        deleteButton.setImage(Asset.deleteIcon.image, for: .normal)
    }
    
    
    
}
