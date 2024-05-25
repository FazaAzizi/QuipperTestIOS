//
//  CourseListTVCTableViewCell.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import UIKit

class CourseListTVC: UITableViewCell {

    @IBOutlet weak var roundedContentView: UIView!
    @IBOutlet weak var tumbnailImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var presenterLbl: UILabel!
    
    static let identifier = String(describing: CourseListTVC.self)
    static let nib = {
       UINib(nibName: identifier, bundle: nil)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedContentView.layer.cornerRadius = 8
        roundedContentView.layer.borderColor = UIColor.systemGray4.cgColor
        roundedContentView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension CourseListTVC {
    func configure(data: CourseEntity) {
        titleLbl.text = data.title
        presenterLbl.text = data.presenterName
        tumbnailImg.loadImageUrl(data.thumbnailURL)
    }
}
