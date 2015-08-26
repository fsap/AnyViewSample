//
//  ApiArticlesViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/26.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import Foundation
import UIKit

class ApiArticlesViewController: ApiBaseViewController {
    
    @IBOutlet weak var articlesTableView: UITableView?
    
    private var articleSections: [String] = [
        "latest_top_articles",
        "series_articles",
        "series_article_list_url",
        "latest_bottom_articles"
    ]

    
    private var articles: [String: AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LogM("viewDidLoad")
        
        startRequestApi("articles",
            params: nil,
            success: { (response) -> Void in
            
            }, failure: { (error: NSError)->Void in
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func parseResponseForArticles(response: AnyObject) {
        
        for sectionName in articleSections {
            
        }
        
    }

    
    //
    // MARK: UITableViewDelegate
    //
    
    // セクションの数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return articleSections.count
    }
    
    // セクション内の行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName: String = articleSections[section]
        let articlesInSection: AnyObject = articles[sectionName]!
        return articlesInSection.count
    }
    
    // セルの設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        // 再利用するセルの取得
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! UITableViewCell
        
        // セルの設定
//        let sectionName: String = apiSections[indexPath.section]
//        let listInSection: [String] = apiList[sectionName]!
//        cell.textLabel?.text = listInSection[indexPath.row]
        
        return cell
    }
}