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
    
    required init(coder aDecoder: NSCoder) {
        self.actionOkBlock = {}
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.actionOkBlock = {}
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
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