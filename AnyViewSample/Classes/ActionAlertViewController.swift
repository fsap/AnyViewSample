//
//  ActionAlertViewController.swift
//  AnyViewSample
//
//  Created by 藤原修市 on 2015/08/06.
//  Copyright (c) 2015年 fsap. All rights reserved.
//

import UIKit

class ActionAlertViewController: UIViewController, UIAlertViewDelegate {
    
    var actionOkBlock: (()->Void)
    var actionCancelBlock: (()->Void)
    
    required init(coder aDecoder: NSCoder) {
        self.actionOkBlock = {}
        self.actionCancelBlock = {}
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.actionOkBlock = {}
        self.actionCancelBlock = {}
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // メッセージダイアログ(OKボタンのみ)
    func show(parentViewController: UIViewController?, title: String, message: String, actionOk: (()->Void))->Void {
        if objc_getClass("UIAlertController") != nil {
            var alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            if parentViewController != nil {
                let alertAction = UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                    actionOk()
                })
                alertController.addAction(alertAction)
                let viewController = parentViewController!
                viewController.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            var alertView: UIAlertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            self.actionOkBlock = actionOk
        }
    }
    
    // メッセージダイアログ(OK, Cancelボタン)
    func show(parentViewController: UIViewController?, title: String, message: String, actionOk: (()->Void), actionCancel: (()->Void)?) {
        if objc_getClass("UIAlertController") != nil {
            var alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            if parentViewController != nil {
                let alertOkAction = UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                    actionOk()
                })
                let alertCancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                    if actionCancel != nil {
                        actionCancel!()
                    }
                })
                alertController.addAction(alertOkAction)
                alertController.addAction(alertCancelAction)
                let viewController = parentViewController!
                viewController.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            var alertView: UIAlertView = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            self.actionOkBlock = actionOk
        }
    }
    
    
    //
    // MARK: UIAlertViewDelegate
    //
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == alertView.cancelButtonIndex {
            // Canceled
            self.actionOkBlock()
        } else {
            // OK
        }
    }
}