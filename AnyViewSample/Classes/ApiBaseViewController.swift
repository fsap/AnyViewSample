//
//  ApiArticlesViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/26.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation
import UIKit

class ApiBaseViewController: UITableViewController {
    
    @IBOutlet weak var resultTableView: UITableView?
    

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
    // MARK: Private
    //
    func startRequestApi(path: String, params: AnyObject?, success:((response: AnyObject)->Void), failure:((error: NSError)->Void)) {
        let apiManager: AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        
        // Headerの設定
        apiManager.requestSerializer.setValue(NSString(format: API.kRequestHeaderAuthorizationValueFormat, API.kBridgeSessionIdForTest) as String,
            forHTTPHeaderField: API.kRequestHeaderAuthorization)
        
        // request
        apiManager.GET(API.kApiDomain.stringByAppendingPathComponent(path),
            parameters: params,
            success: { (operation: AFHTTPRequestOperation, response: AnyObject) -> Void in
                success(response: response)
                
            }, failure: {(operation: AFHTTPRequestOperation, error: NSError) -> Void in
                Log(NSString(format: "api error. code:%d msg:%@", error.code, error.description))
                failure(error: error)
        })
    }
    
    //
    // MARK: UITableViewDelegate
    //
    
    // セクションの数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! UITableViewCell
        
        return cell
    }
    
    // セルが選択された
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    
    // 編集可否の設定
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        return false
    }
}