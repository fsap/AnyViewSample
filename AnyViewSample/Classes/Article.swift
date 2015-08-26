//
//  Article.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/26.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation

enum ArticleResponseKey: String {
    case Id                 = "id"
    case Author             = "author"
    case CategoryName       = "category_name"
    case SubCategoryNames   = "sub_category_names"
    case FeatureType        = "feature_type"
    case FeatureThumbnailUrl = "feature_thumbnail_url"
}

class Article: NSObject {
    
    var id: Int
    var author: Author
    var categoryName: String
    var subCategoryNames: [String]
    var featureType: Int
    var featureThumbnailUrl: String
    var pickupUser: User
    var url: String
    var imageLUrl: String
    var imageMUrl: String
    var imageSUrl: String
    var titleL: String
    var titleM: String
    var titleS: String
    var likeCount: Int
    var clipCount: Int
    var liked: Bool
    var clipped: Bool
    var openDate: String
    var openTs: Int
    
    override init() {
        self.id = 0
        self.author = Author()
        self.categoryName = ""
        self.subCategoryNames = []
        self.featureType = 0
        self.featureThumbnailUrl = ""
        self.pickupUser = User()
        self.url = ""
        self.imageLUrl = ""
        self.imageMUrl = ""
        self.imageSUrl = ""
        self.titleL = ""
        self.titleM = ""
        self.titleS = ""
        self.likeCount = 0
        self.clipCount = 0
        self.liked = false
        self.clipped = false
        self.openDate = ""
        self.openTs = 0
    }
    
    convenience init(dictionary: [String: AnyObject]) {
        self.init()
        self.id = dictionary[ArticleResponseKey.Id.rawValue] as! Int
    }
}