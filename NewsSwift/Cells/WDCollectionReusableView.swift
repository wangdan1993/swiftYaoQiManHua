//
//  WDCollectionReusableView.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit
typealias swiftBlock = () ->()
class WDCollectionReusableView: UICollectionReusableView {
    
    var callBack: swiftBlock!
    var imageView = UIImageView()
    var txtLabel = UILabel()
    var button = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame);
        imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        self.addSubview(imageView)
        
        txtLabel = WDCommonView.commonLableWithFrame(frame: CGRect(x: imageView.wd_right + 20, y: 10, width: 100, height: 20), text: "ddd", color: UIColor.black, font: UIFont.systemFont(ofSize: 14), textAlignment: .left);
        self.addSubview(txtLabel);
        
        button = WDCommonView.commonButtonWithFrame(frame: CGRect(x: screenWidth - 50, y: 10, width: 30, height: 20), title: "...", color: UIColor.black, font: UIFont.systemFont(ofSize: 15), target: self, action: #selector(moreAction))
        self.addSubview(button)
    }
    @objc func moreAction(){
       if let _ = callBack{
            callBack()
        }
    }
    var model = ComicListModel() {
        didSet{
            //            guard let model = model else { return }
            imageView.kf.setImage(urlString: model.titleIconUrl)
            txtLabel.text = "\(model.itemTitle ?? "")"
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
