//
//  TrendingCell.swift
//  YouTube
//
//  Created by afbdev on 1/15/17.
//  Copyright © 2017 afbdev. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {

    override func fetchVideos() {
        super.fetchVideos()
        
        ApiService.sharedInstance.fetchTrendingFeed { (videos: [Video]) in
            
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
