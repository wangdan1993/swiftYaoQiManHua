//
//  MoreViewController.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import SVProgressHUD
class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

     var argCon: Int = 0
     var argName: String?
     var argValue: Int = 0
     var page: Int = 1
    
     var comicList = [ComicModel]()
     var spinnerName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView);
        loadData()
        // Do any additional setup after loading the view.
    }
    func loadData(){
        var params = [String : AnyObject]()
        
        params = ["time": Int32(Date().timeIntervalSince1970) as AnyObject,
                  "device_id": UIDevice.current.identifierForVendor!.uuidString as AnyObject,
                  "key": "fabe6953ce6a1b8738bd2cabebf893a472d2b6274ef7ef6f6a5dc7171e5cafb14933ae65c70bceb97e0e9d47af6324d50394ba70c1bb462e0ed18b88b26095a82be87bc9eddf8e548a2a3859274b25bd0ecfce13e81f8317cfafa822d8ee486fe2c43e7acd93e9f19fdae5c628266dc4762060f6026c5ca83e865844fc6beea59822ed4a70f5288c25edb1367700ebf5c78a27f5cce53036f1dac4a776588cd890cd54f9e5a7adcaeec340c7a69cd986:::open" as AnyObject,
                     "model": UIDevice.current.modelName,
                     "target": "U17_3.0",
                     "version": Bundle.main.infoDictionary!["CFBundleShortVersionString"]!] as [String : AnyObject]
        
        params["argCon"] = argCon as AnyObject
        if (argName) != nil {
            params["argName"] = argName as AnyObject
            
        }
        params["argValue"] = argValue as AnyObject
        params["page"] = max(1, page) as AnyObject
        

        Alamofire.request("http://app.u17.com/v3/appV3_3/ios/phone/list/commonComicList", method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if let Error = response.result.error{
                print(Error)
            }else if let jsonresult = response.result.value{
                let jsonDictory = JSON(jsonresult);
                if jsonDictory["code"] > 0 {
                let data  = jsonDictory["data"]["returnData"]["rankinglist"].array;
                for dataDic in data! {
                    var model = ComicModel();
                    
                    model.cover = dataDic["cover"].string!
                    model.title = dataDic["title"].string!
                    model.subTitle = dataDic["subTitle"].string!
                    //                    let numString = String(format: "%d", dataDic["likes_count"].intValue)
                    //                    model.likecount = numString
                    self.comicList.append(model)
                    
                    
                    
                }
                self.tableView.reloadData()
                
                }else{
                    
                    SVProgressHUD.showInfo(withStatus: "没有更多数据啦！")

                    return
                }
            }
            
        }
    }
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - kTopHeight), style: .plain)
        tw.backgroundColor = UIColor.background
        tw.tableFooterView = UIView()
        tw.delegate = self
        tw.dataSource = self
        tw.register(WDTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tw
    }()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WDTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WDTableViewCell
        let rankmodel = comicList[indexPath.row];
        cell.cmodel = rankmodel
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicList.count
    }
    convenience init(argCon: Int = 0, argName: String?, argValue: Int = 0) {
        self.init()
        self.argCon = argCon
        self.argName = argName
        self.argValue = argValue
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
