//
//  BookEntity.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/06.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation
import CoreData

class BookEntity: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var title: String
    @NSManaged var filename: String
    @NSManaged var filesize: NSNumber
    @NSManaged var sort_num: NSNumber
    @NSManaged var creator: String
    @NSManaged var date: NSDate
    @NSManaged var identifier: String
    @NSManaged var format: String
    @NSManaged var language: String
    @NSManaged var publisher: String

}
