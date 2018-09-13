//
//  WDCollectionViewCell.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit

class WDCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    var txtLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: (screenWidth - 4)/3, height: 250))
        self.addSubview(imageView)
        
        txtLabel = WDCommonView.commonLableWithFrame(frame: CGRect(x: 0, y: imageView.wd_bottom, width: imageView.wd_width, height: 40), text: "xxxx", color: UIColor.black, font: UIFont.systemFont(ofSize: 15), textAlignment: .center)
        self.addSubview(txtLabel)
    }
    var model = ComicModel() {
        didSet{
            //            guard let model = model else { return }
            imageView.kf.setImage(urlString: model.cover)
            txtLabel.text = "\(model.name ?? "")"
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
