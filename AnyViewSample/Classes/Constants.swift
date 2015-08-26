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
    static let kApiListDefaultSectionHeight: CGFloat = 25.0
    static let kApiListDefaultRowHeight: CGFloat = 40.0
    
    static let kBookEntityName: String = "Book"
}

struct API {
    static let kApiDomain: String = "http://api.enish10.cent7.edist.syapp.jp/"
    static let kBridgeSessionIdForTest: String = "8d73bea63321fee2edd2f42fe79da88bd57efcc17542f3a9dab738ba7ad554f6d9dc3da1538c1289c9381fe361d46921ef1b0014da0b3e25efec17ee2abe6720"
    
    static let kRequestHeaderAuthorization: String = "Authorization"
    static let kRequestHeaderAuthorizationValueFormat: String = "session_id %@"
}

enum SampleViews :Int {
    case TableViewSample1 = 0,
        ActionAlert,
        CoreDataSample,
        LoadXml,
        Api,
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
        case .Api: return "API List"
        default: return ""
        }
    }
    
    func segueName()->String {
        switch self {
        case .TableViewSample1: return "TableViewSample1"
        case .ActionAlert: return "ActionAlert"
        case .CoreDataSample: return "CoreDataSample"
        case .LoadXml: return "LoadXml"
        case .Api: return "API"
        default: return ""
        }
    }
}

enum ApiViewSections: Int {
    case Articles = 0,
        Users,
        _count

    static var count :Int {
        return self._count.hashValue
    }
    
    func sectionName()->String {
        switch self {
        case .Articles: return "Articles"
        case .Users: return "Users"
        default: return ""
        }
    }
    
    func apiList()->[String] {
        switch self {
        case .Articles: return [
            "(GET) /articlemedia",
            "(GET) /articles"
        ]
        case .Users: return [
            "(GET) /users/:id"
        ]
        default: return []
        }
    }
}
