//
//  AppointmentTableViewCell.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 12/18/20.
//

import UIKit
import Cosmos
protocol appointDeleteCellDelegate: AnyObject {
    func btnDeleteTapped(cell: AppointmentTableViewCell)
}
class AppointmentTableViewCell: UITableViewCell {

    weak var delegate: appointDeleteCellDelegate?
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorRating: CosmosView!
    @IBOutlet weak var doctorReviewCounts: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doctorInfo: UILabel!
    @IBOutlet weak var addressImage: UIImageView!
    @IBOutlet weak var viewOnMap: UIButton!
    @IBOutlet weak var appointDate: UILabel!
    @IBOutlet weak var apointTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        self.delegate?.btnDeleteTapped(cell: self)
    }
    
    @IBAction func mapPressed(_ sender: Any) {
        self.delegate?.btnDeleteTapped(cell: self)
    }
    
    func configureCell(appointment: AppointmentItems) {
        let date = Date(timeIntervalSince1970: TimeInterval(appointment.appointment))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = L10n.date
        let strDate = dateFormatter.string(from: date)
        let array = strDate.components(separatedBy: CharacterSet(charactersIn: "/"))
     
        doctorImage.kf.setImage(with: URL(string: appointment.doctor.image))
        doctorName.text = "\(appointment.doctor.name)"
        doctorRating.rating = Double(appointment.doctor.rating)
        doctorReviewCounts.text = "\(appointment.doctor.reviewsCount) \(L10n.views)"
        doctorInfo.text = appointment.doctor.bio
        appointDate.text = array[0]
        apointTime.text = array[1]
        
    }
}

extension AppointmentTableViewCell {
    func updateUI(){
        setupImages(imageView: doctorImage)
        viewOnMap.titleLabel?.font = FontFamily.PTSans.regular.font(size: 13)
        viewOnMap.titleLabel?.textColor = UIColor(named: ColorName.white)
        doctorRating.settings.updateOnTouch = false
        doctorRating.settings.filledImage = Asset.rate.image
        doctorRating.settings.emptyImage = Asset.unfill.image
        doctorRating.settings.fillMode = .precise
        
        addressImage.image = Asset.pin.image
        
        doctorName.font = FontFamily.PTSans.bold.font(size: 15)
        doctorName.textColor = UIColor(named: ColorName.white)
        doctorReviewCounts.font = FontFamily.PTSans.regular.font(size: 12)
        doctorReviewCounts.textColor = UIColor(named: ColorName.white)
        doctorInfo.textColor = UIColor(named: ColorName.white)
        doctorInfo.font = FontFamily.PTSans.regular.font(size: 10)
        appointDate.font = FontFamily.PTSans.regular.font(size: 13)
        appointDate.textColor = UIColor(named: ColorName.white)
        apointTime.font = FontFamily.PTSans.regular.font(size: 13)
        apointTime.textColor = UIColor(named: ColorName.white)
        deleteButton.setImage(Asset.deleteIcon.image, for: .normal)
    }
}
