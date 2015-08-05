//
//  MainViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/05.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // メニュー
//    var menu :[SampleViews:String] = [SampleViews.TableViewSample1: "Table View Sample 1", SampleViews.TableViewSample2: "Table View Sample 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    
    //
    // MARK: UITableViewDelegate
    //
    
    // セクションの数
    
    // セクション内の行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SampleViews.count
    }
    
    // セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 再利用するセルの取得
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        // ToDo:セルの設定
        var view :SampleViews = SampleViews(rawValue: indexPath.row)!
        cell.textLabel?.text = view.viewName()
        
        return cell
    }

    // セルが選択された
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

