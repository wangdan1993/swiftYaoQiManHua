//
//  ViewController.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/18.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit
import SGPagingView
import Alamofire
import SwiftyJSON
import Kingfisher
import LLCycleScrollView
import SnapKit
class itemModel: NSObject {
    var cover_image_url = ""
    var title = ""
    var likecount = ""
    
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    var gifttableview: UITableView!
    
    var dataArray = [itemModel]()
    //    数据模型类似oc的JSONModel
    private var galleryItems = [GalleryItemModel]()
    //    商标滚动
    private lazy var bannerView: LLCycleScrollView = {
        let bw = LLCycleScrollView()
        bw.backgroundColor = UIColor.orange
        bw.autoScrollTimeInterval = 6
        bw.placeHolderImage = UIImage(named: "normal_placeholder")
        bw.coverImage = UIImage()
        bw.pageControlPosition = .right
        bw.pageControlBottom = 20
        bw.titleBackgroundColor = UIColor.clear
        bw.lldidSelectItemAtIndex = didSelectBanner(index:)
        return bw
    }()
    private func didSelectBanner(index: NSInteger) {
        print(index)
//        let item = galleryItems[index]
//        if item.linkType == 2 {
//            guard let url = item.ext?.flatMap({ return $0.key == "url" ? $0.val : nil }).joined() else { return }
//            let vc = UWebViewController(url: url)
//            navigationController?.pushViewController(vc, animated: true)
//        } else {
//            guard let comicIdString = item.ext?.flatMap({ return $0.key == "comicId" ? $0.val : nil }).joined(),
//                let comicId = Int(comicIdString) else { return }
//            let vc = UComicViewController(comicid: comicId)
//            navigationController?.pushViewController(vc, animated: true)
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
       
        self.DownLoadData();
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    func DownLoadData(){
//        http://app.u17.com/v3/appV3_3/ios/phone/comic/boutiqueListNew?sexType=1&v=3320101
        Alamofire.request("http://app.u17.com/v3/appV3_3/ios/phone/comic/boutiqueListNew?sexType=1&v=3320101", method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if let Error = response.result.error{
                print(Error)
            }else if let jsonresult = response.result.value{
                let jsonDictory = JSON(jsonresult);
                let data  = jsonDictory["data"]["returnData"]["galleryItems"].array;
                for dataDic in data! {
                    var model = GalleryItemModel();
                    model.cover = dataDic["cover"].string!
                    model.title = dataDic["title"].string!
//                    let numString = String(format: "%d", dataDic["likes_count"].intValue)
//                    model.likecount = numString
                    self.galleryItems.append(model)
                    self.galleryItems.append(model)
                    
                    
                    
                }
                self.gifttableview.reloadData()
                self.bannerView.imagePaths = self.galleryItems.filter { $0.cover != nil }.map { $0.cover! }
                
            }
        }
        
        
        
        
        
        /*
        Alamofire.request("http://api.liwushuo.com/v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if let Error = response.result.error{
                print(Error)
            }else if let jsonresult = response.result.value{
                let jsonDictory = JSON(jsonresult);
                let data  = jsonDictory["data"]["items"].array;
                for dataDic in data! {
                    let model = itemModel();
                    model.cover_image_url = dataDic["url"].string!
                    model.title = dataDic["title"].string!
                    let numString = String(format: "%d", dataDic["likes_count"].intValue)
                    model.likecount = numString
                    self.dataArray.append(model)
                    
                    
                    
                }
                self.gifttableview.reloadData()
                
                
            }
        }
 */
    }
    func createUI(){
        bannerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 150)
        gifttableview = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain);
        self.view.addSubview(gifttableview);
        gifttableview.delegate = self;
        gifttableview.dataSource = self;
        gifttableview.rowHeight = 100
        gifttableview.backgroundColor = UIColor.red;
        gifttableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
//        gifttableview.tableHeaderView = bannerView
        self.view.addSubview(bannerView)
        gifttableview.contentInset.top = 150
        
        bannerView.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(gifttableview.contentInset.top)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.galleryItems.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!;
//        cell?.imageView?.image = UIImage(
        let model = self.galleryItems[indexPath.row]
        cell.imageView?.kf.setImage(with: ImageResource(downloadURL: URL.init(string: model.cover!)!))
        cell.textLabel?.text = model.title
        return cell;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == gifttableview {
            bannerView.snp.updateConstraints{ $0.top.equalToSuperview().offset(min(0, -(scrollView.contentOffset.y + scrollView.contentInset.top))) }
        }
    }
}

