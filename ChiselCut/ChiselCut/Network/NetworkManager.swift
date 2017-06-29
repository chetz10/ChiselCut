//
//  NetworkManager.swift
//  ChiselCut
//
//  Created by Chetan Chauhan on 20/06/17.
//  Copyright © 2017 Chetan Chauhan. All rights reserved.
//

import UIKit
import Alamofire

struct NetworkConstant {
   static let urlString:String = "http://vimeo.com/api/v2/album/"
}

class NetworkManager: NSObject {
    
    var urlApiString:String?
    func getVideoItems(completion: @escaping (NSArray?, Error?) -> Void) {
        
        let completeUrlString = String.init(format: "%@%@",  NetworkConstant.urlString, urlApiString!)
        
        Alamofire.request(completeUrlString).responseJSON { response in
            switch response.result {
            case .success(let JSON):
            print("Success with JSON: \(JSON)")
            
            var videoModelList:NSArray?
            videoModelList = videoViewModel().parseResponse(JSON: JSON)
            completion(videoModelList, nil)
                
            
                
            case .failure(let error):
                print("Request failed with error: \(error)")
                completion(nil, error)
            }
            

            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func downloadImage(forUrl:String, completion: @escaping (UIImage?, Error?) -> Void) {
        
        Alamofire.request(forUrl, method: .get).responseData { response in
            DispatchQueue.global().async {
                guard let imageData = response.result.value else {
                    // Handle error
                    print("Down load fail")
                    completion (nil, response.result.error)
                    return
                }
                let image = UIImage(data: imageData)
                completion(image, nil)
            }
        }
    }
  

}
