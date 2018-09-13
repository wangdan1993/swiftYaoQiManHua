//
//  URefresh.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/23.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import Foundation
import MJRefresh

class RefreshHeader: MJRefreshGifHeader {
    
    /// 初始化
    override func prepare() {
        super.prepare()
        // 图片数组
//        var images = [UIImage]()
//        // 遍历
//        for index in 0..<16 {
//            let image = UIImage(named: "dropdown_loading_0\(index)")
//            images.append(image!)
//        }
//        // 设置空闲状态的图片
//        setImages(images, for: .idle)
//        // 设置刷新状态的图片
//        setImages(images, for: .refreshing)
        setTitle("下拉推荐", for: .idle)
        setTitle("松开推荐", for: .pulling)
        setTitle("推荐中", for: .refreshing)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        gifView.contentMode = .center
        gifView.frame = CGRect(x: 0, y: 4, width: mj_w, height: 25)
        stateLabel.font = UIFont.systemFont(ofSize: 12)
        stateLabel.frame = CGRect(x: 0, y: 35, width: mj_w, height: 14)
    }
    
}

class RefreshAutoGifFooter: MJRefreshAutoGifFooter {
    
    /// 初始化
    override func prepare() {
        super.prepare()
        // 设置控件的高度
        mj_h = 50
//        // 图片数组
//        var images = [UIImage]()
//        // 遍历
//        for index in 0..<8 {
//            let image = UIImage(named: "sendloading_18x18_\(index)")
//            images.append(image!)
//        }
//        // 设置空闲状态的图片
//        setImages(images, for: .idle)
        // 设置刷新状态的图片
//        setImages(images, for: .refreshing)
        setTitle("上拉加载数据", for: .idle)
        setTitle("正在努力加载", for: .pulling)
        setTitle("正在努力加载", for: .refreshing)
        setTitle("没有更多数据啦", for: .noMoreData)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        gifView.wd_x = 135
        gifView.wd_centerY = stateLabel.wd_centerY
    }
    
}
//extension UIScrollView {
//    var uHead: MJRefreshHeader {
//        get { return mj_header }
//        set { mj_header = newValue }
//    }
//
//    var uFoot: MJRefreshFooter {
//        get { return mj_footer }
//        set { mj_footer = newValue }
//    }
//}
//
//class URefreshHeader: MJRefreshGifHeader {
//    override func prepare() {
//        super.prepare()
//        setTitle("上拉加载数据", for: .idle)
//        setTitle("正在努力加载", for: .pulling)
//        setTitle("正在努力加载", for: .refreshing)
//        setTitle("没有更多数据啦", for: .noMoreData)
////        setImages([UIImage(named: "refresh_normal")!], for: .idle)
////        setImages([UIImage(named: "refresh_will_refresh")!], for: .pulling)
////        setImages([UIImage(named: "refresh_loading_1")!,
////                   UIImage(named: "refresh_loading_2")!,
////                   UIImage(named: "refresh_loading_3")!], for: .refreshing)
//
//        lastUpdatedTimeLabel.isHidden = true
//        stateLabel.isHidden = true
//    }
//}
//
//class URefreshAutoHeader: MJRefreshHeader {}
//
//class URefreshFooter: MJRefreshBackNormalFooter {}
//
//class URefreshAutoFooter: MJRefreshAutoFooter {}
//
//
//class URefreshDiscoverFooter: MJRefreshBackGifFooter {
//
//    override func prepare() {
//        super.prepare()
//        backgroundColor = UIColor.background
//        setTitle("上拉加载数据", for: .idle)
//
////        setImages([UIImage(named: "refresh_discover")!], for: .idle)
//        stateLabel.isHidden = true
//        refreshingBlock = { self.endRefreshing() }
//    }
//}
//
//class URefreshTipKissFooter: MJRefreshBackFooter {
//
//    lazy var tipLabel: UILabel = {
//        let tl = UILabel()
//        tl.textAlignment = .center
//        tl.textColor = UIColor.lightGray
//        tl.font = UIFont.systemFont(ofSize: 14)
//        tl.numberOfLines = 0
//        return tl
//    }()
//
//    lazy var imageView: UIImageView = {
//        let iw = UIImageView()
////        iw.image = UIImage(named: "refresh_kiss")
//        return iw
//    }()
//
//    override func prepare() {
//        super.prepare()
//        backgroundColor = UIColor.background
//        mj_h = 240
//        addSubview(tipLabel)
////        addSubview(imageView)
//    }
//    
//    override func placeSubviews() {
//        tipLabel.frame = CGRect(x: 0, y: 40, width: bounds.width, height: 60)
////        imageView.frame = CGRect(x: (bounds.width - 80 ) / 2, y: 110, width: 80, height: 80)
//    }
//
//    convenience init(with tip: String) {
//        self.init()
//        refreshingBlock = { self.endRefreshing() }
//        tipLabel.text = tip
//    }
//}
