//
//  UIAlertController+Extension.swift
//  SmallVillage
//
//  Created by 李 on 16/8/2.
//  Copyright © 2016年 chenglv. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    class func showAlert(
        presentController: UIViewController!,
        title: String!,
        message: String!,
        cancelButtonTitle: String? = "取消",
        okButtonTitle: String? = "确认") {
        let alert = UIAlertController(title: title!, message: message!, preferredStyle: UIAlertControllerStyle.Alert)
        if (cancelButtonTitle != nil) {
            alert.addAction(UIAlertAction(title: cancelButtonTitle!, style: UIAlertActionStyle.Default, handler: nil))// do not handle cancel, just dismiss
        }
        if (okButtonTitle != nil) {
            alert.addAction(UIAlertAction(title: okButtonTitle!, style: UIAlertActionStyle.Default, handler: nil))// do not handle cancel, just dismiss
        }
        
        presentController!.presentViewController(alert, animated: true, completion: nil)
    }
    
    class func showAlert(
        presentController: UIViewController!,
        title: String!,
        message: String!,
        cancelButtonTitle: String? = "取消",
        okButtonTitle: String? = "确认",
        okHandler: ((UIAlertAction!) -> Void)!) {
        let alert = UIAlertController(title: title!, message: message!, preferredStyle: UIAlertControllerStyle.Alert)
        if (cancelButtonTitle != nil) {
            alert.addAction(UIAlertAction(title: cancelButtonTitle!, style: UIAlertActionStyle.Default, handler: nil))// do not handle cancel, just dismiss
        }
        if (okButtonTitle != nil) {
            alert.addAction(UIAlertAction(title: okButtonTitle!, style: UIAlertActionStyle.Default, handler: okHandler))// do not handle cancel, just dismiss
        }
        
        presentController!.presentViewController(alert, animated: true, completion: nil)
    }
}