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
        LogM("viewDidLoad")
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.bookTableView.delegate = self
        self.bookTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // 編集モードへの切り替え
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.bookTableView?.setEditing(editing, animated: animated)
        LogM("setEditing")
    }
    

    //
    // MARK: UITableViewDelegate
    //
    
    // セクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        LogM("sections:[1]")
        return 1
    }
    
    // セクション内の行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Log(NSString(format: "rows:[%d]", bookList.count))
        return bookList.count
    }
    
    // 行の高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Log(NSString(format: "height%f]", Const.kBookListDefaultRowHeight))
        return Const.kBookListDefaultRowHeight
    }
    
    // セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        // 再利用するセルの取得
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath) as! UITableViewCell
        
        // セルの設定
        cell.textLabel?.text = bookList[indexPath.row]
        
        return cell
    }
    
    // セルが選択された
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // 編集可否の設定
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        return true
    }
    
    // 編集時のスタイル
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        Log(NSString(format: "section:[%d] row:[%d] editing:[%@][%@]", indexPath.section, indexPath.row, self.editing.description, self.bookTableView.editing.description))
        if (self.editing) {
            return .Delete
        }
        return .None
    }
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
//    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
//        Log(NSString(format: "section:[%d] row:[%d] editing:[%@]", indexPath.section, indexPath.row, self.editing.description))
//        return "削除"
//    }
    
    
    // 編集の確定
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        Log(NSString(format: "section:[%d] row:[%d] style:[%d]", indexPath.section, indexPath.row, editingStyle.rawValue))
        switch editingStyle {
        case .Delete:
            self.bookList.removeAtIndex(indexPath.row)
            self.bookTableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            return
        default:
            return
        }
    }
    
    
    // 移動可否の設定
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        return true
    }
    
    // 移動の確定
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        Log(NSString(format: "source:[%d] destination:[%d]", sourceIndexPath.row, destinationIndexPath.row))
    }
}
