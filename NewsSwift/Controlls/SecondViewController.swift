//
//  SecondViewController.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var subscribeList = [ComicListModel]()
    private var scribeList = [ComicModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setUI()
        self.view .addSubview(collectionView)
        self.loadData()
        // Do any additional setup after loading the view.
    }
    func loadData(){
//        Alamofire.request("http://app.u17.com/v3/appV3_3/ios/phone/list/newSubscribeList",parameters:nil).responseJSON { (responseJson) in
//            switch responseJson.result {
//            case .success(let data):
//                print(data)
//                //Alamofire默认返回的是一个解析过的数据结构，这里代表一个字典
//                if data is Dictionary<String, Any>{
//                    let data2 = data as! Dictionary<String, Any>
//                    print(data2["Msg"]!)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        Alamofire.request("http://app.u17.com/v3/appV3_3/ios/phone/list/newSubscribeList", method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if let Error = response.result.error{
                print(Error)
            }else if let jsonresult = response.result.value{
                let jsonDictory = JSON(jsonresult);
                let data  = jsonDictory["data"]["returnData"]["newSubscribeList"].array;
                for dataDic in data! {
                    var model = ComicListModel();
                    
                    model.titleIconUrl = dataDic["titleIconUrl"].string!
                    model.itemTitle = dataDic["itemTitle"].string!
                    self.scribeList.removeAll()
                    for comicsData in dataDic["comics"].array!{
                        var cmodel = ComicModel();
                        
                        cmodel.name = comicsData["name"].string
                        cmodel.cover = comicsData["cover"].string
                        self.scribeList.append(cmodel)
                        model.comics = self.scribeList

                    }
                    //                    let numString = String(format: "%d", dataDic["likes_count"].intValue)
                    //                    model.likecount = numString
                    self.subscribeList.append(model)
                    
                    
                    
                }
                self.collectionView.reloadData()
                
                
            }
            
        }
    }
    private lazy var collectionView: UICollectionView = {
        // 滚动方向
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        // 实例化
        let mainCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - kTopHeight), collectionViewLayout: layout)
        // 添加到父视图
        // 属性设置
//        self.mainCollectionView.autoresizingMask = .FlexibleHeight
        mainCollectionView.backgroundColor = UIColor.white
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        // 注册一个cell
        mainCollectionView.register(WDCollectionViewCell.self, forCellWithReuseIdentifier:"cellIdentifier")
        // 注册一个headView
        mainCollectionView.register(WDCollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier")
        // 注册一个footView
//        self.mainCollectionView!.registerClass(CollectionReusableViewFooter.self, forSupplementaryViewOfKind:UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
        // 设置页眉、页脚、cell的宽高，及间隔
        // 方法1 属性化设置（显示有点异常），或方法2-代理方法设置
                layout.itemSize = CGSize(width: (screenWidth - 4)/3, height: 290) // cell的宽高
                layout.minimumLineSpacing = 10.0  // cell的上下间隔
                layout.minimumInteritemSpacing = 2 // cell的左右间隔
        layout.headerReferenceSize = CGSize(width: screenWidth, height: 40) // 页眉宽高
        //        layout.footerReferenceSize = CGSizeMake(width, heightFooter) // 页脚宽高

        return mainCollectionView
    }()
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return subscribeList.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let comicList = subscribeList[section]
        return comicList.comics!.count
    }
    // 返回cell的宽高
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!,
                        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize
    {
        return CGSize(width: (screenWidth - 4)/3, height: 300)
    }
    
    // 返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(0, 2, 0, 2)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSize(width: screenWidth, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WDCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! WDCollectionViewCell
        let comicList = subscribeList[indexPath.section]
        cell.model = comicList.comics![indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          let head  = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier", for: indexPath) as! WDCollectionReusableView
        
            let comicList = subscribeList[indexPath.section]
        head.callBack = {() in
            let vc = MoreViewController(argCon: comicList.argCon, argName: comicList.argName, argValue: comicList.argValue)
            vc.title = comicList.itemTitle
            self.navigationController?.pushViewController(vc, animated: true)
            print(comicList.itemTitle ?? String.self)
        }
            head.model = comicList
            return head
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
