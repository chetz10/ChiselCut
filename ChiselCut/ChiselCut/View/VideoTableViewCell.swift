//
//  VideoTableViewCell.swift
//  ChiselCut
//
//  Created by Chetan Chauhan on 20/06/17.
//  Copyright © 2017 Chetan Chauhan. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var lastUpdatedDateLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var portraitImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        // Configure the view for the selected state
    }
    
    func configureCell(videoModel:VideoModel) {
        UIImage().getImageForUrl(url: videoModel.thumbnailImageUrl, completion: { (thumnailImage, error) in
            DispatchQueue.main.async {
                self.thumbnailImageView.image = thumnailImage
                self.layoutIfNeeded()
            }
        })
        
        UIImage().getImageForUrl(url: videoModel.userPortraitImageUrl, completion: { (portraitImage, error) in
            DispatchQueue.main.async {
                self.portraitImageView.image = portraitImage
            }
            
        })
        
        self.userNameLabel.text = videoModel.userName
        self.videoTitleLabel.text = videoModel.videoTitle
        self.lastUpdatedDateLabel.text = videoViewModel().convertDateToString(date: videoModel.videoUpdateDate as Date)
        self.descriptionTextView.layer.borderColor = UIColor.yellow.cgColor
        self.descriptionTextView.layer.borderWidth = 1.0
        self.descriptionTextView.text = videoModel.videoDescription
    }
}
