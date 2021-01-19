//
//  ResultCell.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/21/20.
//

import UIKit
import Cosmos
import Kingfisher
protocol favoriteCellDelegate: AnyObject {
    func btnTapped(cell: ResultCell)
}
class ResultCell: UITableViewCell {
    weak var delegate: favoriteCellDelegate?
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorRate: CosmosView!
    @IBOutlet weak var doctorReviewCount: UILabel!
    @IBOutlet weak var doctorSpeciality: UILabel!
    @IBOutlet weak var doctorAddress: UILabel!
    @IBOutlet weak var doctorWaitingTime: UILabel!
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var specialtyImage: UIImageView!
    @IBOutlet weak var addressImage: UIImageView!
    @IBOutlet weak var waitingImage: UIImageView!
    @IBOutlet weak var feeImage: UIImageView!
    @IBOutlet weak var headSpecial: UILabel!
    
    @IBOutlet weak var favouriteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // Configure the view for the selected state
    @IBAction func favouritePressed(_ sender: UIButton) {
        delegate?.btnTapped(cell: self)
    }
    
    @IBAction func viewProfilePressed(_ sender: Any) {
        delegate?.btnTapped(cell: self)
    }
    
    
    func configureCell(resultDoctor: ResultItem) {
        
        doctorImage.kf.setImage(with: URL(string: resultDoctor.image))
        doctorName.text = "\(resultDoctor.name)"
        doctorRate.rating = Double(resultDoctor.rating)
        doctorReviewCount.text = "\(resultDoctor.reviewsCount) \(L10n.views)"
        doctorSpeciality.text = resultDoctor.specialty
        doctorAddress.text = resultDoctor.address
        doctorWaitingTime.text = "\(L10n.wating)\(resultDoctor.waitingTime) \(L10n.min)"
        feesLabel.text = "\(L10n.fee)\(resultDoctor.fees) \(L10n.egp)"
        headSpecial.text = resultDoctor.specialty
        if resultDoctor.isFavorited == true {
            favouriteBtn.setImage(Asset.heart2.image, for: .normal)
        }
    }
    
    
    
    
}
extension ResultCell{
    func updateUI(){
        bookNowBtn.setButtonDesign(title: L10n.bookBtn)
        setupImages(imageView: doctorImage)
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
        favouriteBtn.setImage(Asset.heart.image, for: .normal)
        
    }
    
    
    
}

