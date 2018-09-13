//
//  WDTableViewCell.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/18.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit

class WDTableViewCell: UITableViewCell {
    var titleLabel:UILabel?
    var contentLabel: UILabel?
    var bgImageView:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.bgImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: screenWidth/2, height: 150));
        self.bgImageView?.backgroundColor = UIColor.red;
        self.contentView.addSubview(self.bgImageView!);
        
        self.titleLabel = WDCommonView.commonLableWithFrame(frame: CGRect(x: (self.bgImageView?.wd_right)! + 5, y: (self.bgImageView?.wd_top)!, width: screenWidth/2, height: (self.bgImageView?.wd_height)!/2), text: "xxxx", color: .black, font: .systemFont(ofSize: 15), textAlignment: .left)
        self.contentView.addSubview(titleLabel!)
        self.contentLabel = WDCommonView.commonLableWithFrame(frame: CGRect(x: (self.bgImageView!.wd_right) + 5, y: (self.titleLabel?.wd_bottom)!, width: screenWidth/2, height: (self.bgImageView?.wd_height)!/2), text: "xxxxxxxx", color: .black, font: .systemFont(ofSize: 15), textAlignment: .left)
        contentLabel?.numberOfLines = 0;
        self.contentView.addSubview(contentLabel!)
        
        let line = UIView(frame: CGRect(x: 0, y: (bgImageView?.wd_bottom)!+10, width: screenWidth, height: 10))
        line.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(line)
    }
    
    var model = RankingModel() {
        didSet{
//            guard let model = model else { return }
            bgImageView?.kf.setImage(urlString: model.cover)
            titleLabel?.text = "\(model.title ?? "")榜"
            contentLabel?.text = model.subTitle
        }
    }
    
    var cmodel = ComicModel() {
        didSet{
            //            guard let model = model else { return }
            bgImageView?.kf.setImage(urlString: cmodel.cover)
            titleLabel?.text = cmodel.name
            contentLabel?.text = cmodel.description
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
