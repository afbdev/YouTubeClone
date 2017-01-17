//
//  ApiService.swift
//  YouTube
//
//  Created by afbdev on 1/15/17.
//  Copyright © 2017 afbdev. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    // video 11/20, 18:00
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString("\(baseUrl)/home.json", completion: completion)
    }

    func fetchTrendingFeed(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString("\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForUrlString("\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchFeedForUrlString(_ urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, respons, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    
//                    var videos = [Video]()
//                    
//                    for dictionary in jsonDictionaries {
//                        let video = Video(dictionary: dictionary)
//                        videos.append(video)
//                    }
                    
//                    let videos = jsonDictionaries.map({return Video(dictionary: $0)})
                    
                    DispatchQueue.main.async(execute: {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    })
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    
//    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//    
//    // Construct new array by executing parantheses '()'
//    var videos = [Video]()
//    
//    for dictionary in json as! [[String: AnyObject]] {
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//    
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//    video.channel = channel
//    
//    videos.append(video)
//    
//    // Get back onto the Main Thread - video 6/20, 2:00
//    DispatchQueue.main.async(execute: {
//    completion(videos)
//    })
}








