//
//  Layout.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    public var wd_x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
            
        }
    }
    
    public var wd_y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
            
        }
    }
    
    /// size
    var wd_size: CGSize {
        get { return frame.size }
        set {
            var tempFrame: CGRect = frame
            tempFrame.size        = newValue
            frame                 = tempFrame
        }
    }
    
    /// centerX
    var wd_centerX: CGFloat {
        get { return center.x }
        set {
            var tempCenter: CGPoint = center
            tempCenter.x            = newValue
            center                  = tempCenter
        }
    }
    
    /// centerY
    var wd_centerY: CGFloat {
        get { return center.y }
        set{
            var tempCenter: CGPoint = center
            tempCenter.y            = newValue
            center                  = tempCenter;
        }
    }
    
    /// height
    var wd_height: CGFloat {
        get { return frame.size.height }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var wd_width: CGFloat {
        get { return frame.size.width }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width  = newValue
            frame = tempFrame
        }
    }
    /// left
    var wd_left: CGFloat {
        get { return self.frame.origin.x }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x  = newValue
            frame = tempFrame
        }
    }
    /// top
    var wd_top: CGFloat {
        get { return self.frame.origin.y }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y  = newValue
            frame = tempFrame
        }
    }
    
    /// right
    var wd_right: CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x  = newValue - frame.size.width
            frame = tempFrame
        }
    }
    /// bottom
    var wd_bottom: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y  = newValue - frame.size.height
            frame = tempFrame
        }
    }
}
