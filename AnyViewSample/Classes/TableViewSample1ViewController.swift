//
//  TableViewSample1ViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/05.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import UIKit

class TableViewSample1ViewController :UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var bookTableView: UITableView!
    
    var bookList :[String] = ["book1", "book2", "book3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
        return bookList.count
    }
    
    // 行の高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return Const.kBookListDefaultRowHeight
    }

    
    // セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 再利用するセルの取得
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        // セルの設定
        cell.textLabel?.text = bookList[indexPath.row]
        
        return cell
    }
    
    // セルが選択された
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}