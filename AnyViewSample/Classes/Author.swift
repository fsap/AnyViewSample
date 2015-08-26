//
//  Author.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/26.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation

class Author: NSObject {
    
    var uid: Int
    var nickname: String
    var title: String
    var thumbnailUrl: String
    
    override init() {
        self.uid = 0
        self.nickname = ""
        self.title = ""
        self.thumbnailUrl = ""
    }
}