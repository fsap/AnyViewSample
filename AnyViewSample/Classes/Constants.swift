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
    static let kMenuDefaultRowHeight :CGFloat = 64.0
}

enum SampleViews :Int {
    case TableViewSample1 = 0,
        TableViewSample2,
        _count
    
    static var count :Int {
        return self._count.hashValue
    }
    
    func viewName()->String {
        switch self {
        case .TableViewSample1: return "Table View Sample 1"
        case .TableViewSample2: return "Table View Sample 2"
        default: return ""
        }
    }
}
