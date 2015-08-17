//
//  Constants.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/05.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation
import UIKit

struct Const {
    static let kMenuDefaultRowHeight: CGFloat = 64.0
    static let kBookListDefaultRowHeight: CGFloat = 64.0
    static let kXmlContentsListDefaultRowHeight: CGFloat = 50.0
    
    static let kBookEntityName: String = "Book"
}

enum SampleViews :Int {
    case TableViewSample1 = 0,
        ActionAlert,
        CoreDataSample,
        LoadXml,
        _count
    
    static var count :Int {
        return self._count.hashValue
    }
    
    func viewName()->String {
        switch self {
        case .TableViewSample1: return "Table View Sample 1"
        case .ActionAlert: return "Show Alert With Action"
        case .CoreDataSample: return "Core Data Sample"
        case .LoadXml: return "Load XML"
        default: return ""
        }
    }
    
    func segueName()->String {
        switch self {
        case .TableViewSample1: return "TableViewSample1"
        case .ActionAlert: return "ActionAlert"
        case .CoreDataSample: return "CoreDataSample"
        case .LoadXml: return "LoadXml"
        default: return ""
        }
    }
}
