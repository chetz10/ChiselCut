//
//  videoViewModel.swift
//  ChiselCut
//
//  Created by Chetan Chauhan on 28/06/17.
//  Copyright © 2017 Chetan Chauhan. All rights reserved.
//

import UIKit

class videoViewModel: NSObject {
    
    func convertStringToDate(dateString:String) -> NSDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString)
        return date! as NSDate
    }
    
    func parseResponse(JSON:Any) -> NSArray {
        let itemList = JSON as! NSArray
        let videoModelItemList:NSMutableArray = NSMutableArray()
        for item  in itemList {
            let result:Dictionary = (item as? Dictionary<String, AnyObject>)!
            
            let username:String = result["user_name"] as! String
            let videoDescription:String = result["description"] as! String
            let videoUpdateDateString:String = result["upload_date"] as! String
            let videoUpdateDate = videoViewModel().convertStringToDate(dateString: videoUpdateDateString)
            let videoTitle:String = result["title"] as! String
            let thumbnailImageUrl:String = result["thumbnail_small"] as! String
            let userPortraitImageUrl:String = result["user_portrait_medium"] as! String
            let videoModelInstance = VideoModel(videoTitle:videoTitle,videoDescription:videoDescription,videoUpdateDate:videoUpdateDate,userName:username,thumbnailImageUrl:thumbnailImageUrl,userPortaitImageUrl:userPortraitImageUrl)
            videoModelItemList.add(videoModelInstance)
        }
        return videoModelItemList
    }
    
    func convertDateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from:date)
        return dateString
    }

}

extension UIImage {
    func getImageForUrl(url:String, completion:@escaping (UIImage?, Error?) -> Void) {
        let networkManager = NetworkManager()
        networkManager.downloadImage(forUrl: url) { (image, error) in
            completion (image, error)
        }
    }
}
