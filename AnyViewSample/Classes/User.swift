//
//  User.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/26.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var uid: Int
    var nickname: String
    var thumbnailUrl: String
    var title: String
    var titleThumbnailUrl: String
    var introduction: String
    var followerCount: Int
    var pageCount: Int
    
    override init() {
        self.uid = 0
        self.nickname = ""
        self.thumbnailUrl = ""
        self.title = ""
        self.titleThumbnailUrl = ""
        self.introduction = ""
        self.followerCount = 0
        self.pageCount = 0
    }
}