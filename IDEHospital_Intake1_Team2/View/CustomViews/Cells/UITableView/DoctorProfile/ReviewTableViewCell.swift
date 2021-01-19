//
//  ReviewTableViewCell.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/2/21.
//

import UIKit
import Cosmos
class ReviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docComment: UILabel!
    @IBOutlet weak var docRate: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        docName.font = FontFamily.PTSans.bold.font(size: 12)
        docComment.font = FontFamily.PTSans.regular.font(size: 10)
        docRate.settings.updateOnTouch = false
        docRate.settings.filledImage = Asset.rate.image
        docRate.settings.emptyImage = Asset.unfill.image
        docRate.settings.fillMode = .precise
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(review: ReviewItem) {
        docName.text = review.commentedBy
        docComment.text = review.comment
        docRate.rating = Double(review.rating)
    }

}
