//
//  videoModel.swift
//  ChiselCut
//
//  Created by Chetan Chauhan on 20/06/17.
//  Copyright © 2017 Chetan Chauhan. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    var videoTitle:String
    var videoDescription:String
    var videoUpdateDate:NSDate
    var userName:String
    var thumbnailImageUrl:String
    var userPortraitImageUrl:String

    init(videoTitle:String, videoDescription:String, videoUpdateDate:NSDate, userName:String, thumbnailImageUrl:String, userPortaitImageUrl:String)  {
        self.videoTitle = videoTitle
        self.videoDescription = videoDescription
        self.videoUpdateDate = videoUpdateDate
        self.userName = userName
        self.thumbnailImageUrl = thumbnailImageUrl
        self.userPortraitImageUrl = userPortaitImageUrl
    }
}
