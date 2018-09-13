//
//  FirstViewController.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJRefresh
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    private var rankList = [RankingModel]()
    private lazy var tableView: UITableView = {
        let tw = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: CGFloat(screenHeight - kTopHeight)), style: .plain)
        tw.backgroundColor = UIColor.background
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.rowHeight = 180
        tw.register(WDTableViewCell.self, forCellReuseIdentifier: "cell");
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(self.loadData))
        tw.mj_header = header
        
        return tw
    }()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WDTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WDTableViewCell
        let rankmodel = rankList[indexPath.row];
        cell.model = rankmodel
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankList.count
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView);
        loadData()
        // Do any additional setup after loading the view.
    }
    @objc func loadData() {
        Alamofire.request("http://app.u17.com/v3/appV3_3/ios/phone/rank/list", method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if let Error = response.result.error{
                print(Error)
            }else if let jsonresult = response.result.value{
                let jsonDictory = JSON(jsonresult);
                let data  = jsonDictory["data"]["returnData"]["rankinglist"].array;
                for dataDic in data! {
                    var model = RankingModel();
                    
                    model.cover = dataDic["cover"].string!
                    model.title = dataDic["title"].string!
                    model.subTitle = dataDic["subTitle"].string!
                    //                    let numString = String(format: "%d", dataDic["likes_count"].intValue)
                    //                    model.likecount = numString
                    self.rankList.append(model)
                    
                    
                    
                }
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
                
            }
            
        }
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
