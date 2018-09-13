//
//  WDCommonView.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit

class WDCommonView: NSObject {
    //    创建UIlabel
   class func commonLableWithFrame(frame: CGRect, text: String, color: UIColor, font: UIFont, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.textColor = color
        label.font = font;
        label.textAlignment = textAlignment;
        label.backgroundColor = UIColor.clear;
        return label;
    }
    
    //    创建UITextField
    class func commonTextFieldWithFrame(frame: CGRect,placeholder: String,color: UIColor,font: UIFont,secureTextEntry: Bool,delegate: AnyObject) -> UITextField{
        let textField = UITextField(frame: frame);
        textField.placeholder = placeholder;
        textField.textColor = color;
        textField.font = font;
        textField.isSecureTextEntry = secureTextEntry;
        textField.borderStyle = UITextBorderStyle.roundedRect;
        textField.delegate = delegate as? UITextFieldDelegate;
        return textField
        
        
    }
    //创建UITextView
    class func commonTextViewWithFrame(frame: CGRect,text:String,color:UIColor,font:UIFont,textAlignment:NSTextAlignment) -> UITextView{
        let textView = UITextView(frame:frame);
        textView.text = text;
        textView.textColor = color;
        textView.textAlignment = textAlignment;
        
        textView.backgroundColor = UIColor.clear;
        textView.isEditable = true;
        textView.isScrollEnabled = true;
        textView.dataDetectorTypes = UIDataDetectorTypes.link;
        
        return textView;
    }
    //创建UIButton
    class func commonButtonWithFrame(frame:CGRect,title:String,color:UIColor,font:UIFont,
                                     target:AnyObject,action:Selector) -> UIButton{
        let btn = UIButton(frame:frame);
        btn.setTitle(title, for: .normal);
        btn.setTitleColor(color, for: .normal);
        btn.titleLabel?.font = font;
        btn.addTarget(target, action: action, for: .touchUpInside);
        
        return btn;
    }
}
