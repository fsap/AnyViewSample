//
//  TableViewSample1ViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/05.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import UIKit

class LoadXmlViewController :UITableViewController, NSXMLParserDelegate {
    
    @IBOutlet weak var xmlTableView: UITableView!
    
    var xmlContents :[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LogM("viewDidLoad")
        
        self.xmlTableView.delegate = self
        self.xmlTableView.dataSource = self
        
        // load xml format file
        startLoadFile()
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
        LogM("sections:[1]")
        return 1
    }
    
    // セクション内の行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Log(NSString(format: "rows:[%d]", xmlContents.count))
        return xmlContents.count
    }
    
    // 行の高さ
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        Log(NSString(format: "height%f]", Const.kXmlContentsListDefaultRowHeight))
        return Const.kXmlContentsListDefaultRowHeight
    }
    
    // セルの設定
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        Log(NSString(format: "section:[%d] row:[%d]", indexPath.section, indexPath.row))
        // 再利用するセルの取得
        var cell :UITableViewCell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath) as! UITableViewCell
        
        // セルの設定
        cell.textLabel?.text = xmlContents[indexPath.row]
        
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

    
    //
    // MARK: Private
    //
    
    // ファイル読み込み
    private func startLoadFile() {
        LogM("Load XML")
        let url: NSURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("what_is_html5_", ofType: "opf")!)!
        var parser: NSXMLParser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        
        parser.parse()
    }
    
    
    //
    // MARK: NSXMLParserDelegate
    //
    
    // parse開始
    func parserDidStartDocument(parser: NSXMLParser) {
        LogM("+++ start parse.")
    }
    
    // 要素の開始タグ読み込み開始
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        Log(NSString(format: "--- tag:[%@]", elementName))
    }
    
    // parse終了
    func parserDidEndDocument(parser: NSXMLParser) {
        LogM("+++ end parse.")
    }
}
