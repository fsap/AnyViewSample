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
        
        // セルの設定
        var view :SampleViews = SampleViews(rawValue: indexPath.row)!
        cell.textLabel?.text = view.viewName()
        
        return cell
    }

    // セルが選択された
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var view :SampleViews = SampleViews(rawValue: indexPath.row)!
        if view == SampleViews.ActionAlert {
            // ダイアログ系(画面遷移無し)
            ActionAlertViewController(nibName: nil, bundle: nil).show(self, title: "確認", message: "ダイアログのサンプル", actionOk:{()->Void in
                LogM("start animation")
                // OKボタンを押した時のアクション
                var popupView: UILabel = UILabel(frame: CGRectMake(0.0, 0.0, 160, 40))
                popupView.layer.cornerRadius = 5.0
                popupView.layer.masksToBounds = true
                popupView.center = self.view.center
                popupView.backgroundColor = UIColor.grayColor()
                popupView.textColor = UIColor.whiteColor()
                popupView.textAlignment = .Center
                popupView.font = UIFont.systemFontOfSize(10)
                popupView.text = "ダイアログを閉じました"
                self.view.addSubview(popupView)
                UIView.animateWithDuration(2, animations: { () -> Void in
                    popupView.alpha = 0.0
                }, completion: { (Bool) -> Void in
                    popupView.removeFromSuperview()
                })
            })
        } else {
            // 画面遷移
            self.performSegueWithIdentifier(view.segueName(), sender: self)
        }
    }
}

