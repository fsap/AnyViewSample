//
//  ApiListViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/26.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation
import UIKit

class ApiListViewController: UITableViewController {
    
    @IBOutlet weak var apiListTableView: UITableView?
    
    var apiSections: [String] = ["Article", "User"]
    var apiList: Dictionary<String,[String]> = [
        "Article": [
            "(GET) /articlemedia",
            "(GET) /articles"
        ],
        "User":[
            "(GET) /users/:id"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LogM("viewDidLoad")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //
    // MARK: UITableViewDelegate
    //
    
    // セクションの数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        Log(NSString(format: "sections:[%d]", ApiViewSections.count))
        return ApiViewSections.count
    }
    
    // セクションの高さ
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Const.kApiListDefaultSectionHeight
    }
    
    // セクションタイトル
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ApiViewSections(rawValue: section)!.sectionName()
    }
    
    // セクション内の行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let listInSection: [String] = ApiViewSections(rawValue: section)!.apiList()
        Log(NSString(format: "rows:[%d]", listInSection.count))
        return listInSection.count
    }
    
    // 行の高さ
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Log(NSString(format: "height%f]", Const.kApiListDefaultRowHeight))
        return Const.kApiListDefaultRowHeight
    }
    
    // セルの設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        // 再利用するセルの取得
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("apiCell", forIndexPath: indexPath) as! UITableViewCell
        
        // セルの設定
        let listInSection: [String] = ApiViewSections(rawValue: indexPath.section)!.apiList()
        cell.textLabel?.text = listInSection[indexPath.row]
        
        return cell
    }
    
    // セルが選択された
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let sectionName: String = ApiViewSections(rawValue: indexPath.section)!.sectionName()
        self.performSegueWithIdentifier(sectionName, sender: self)
    }
    
    
    // 編集可否の設定
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        return false
    }
    
}