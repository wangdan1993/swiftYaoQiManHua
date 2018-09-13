//
//  ThreeViewController.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class ThreeViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadData()
        // Do any additional setup after loading the view.
    }
    func reloadData(){
        let recommend_collectionurl = "http://capi.douyucdn.cn/api/v1/getbigDataRoom?aid=ios&client_sys=ios&time=1468636740&token=30890623_1b036814902f6451&auth=7d7026a323e09dd55c71ca215fc9d4b2"
        
        
        Alamofire.request(recommend_collectionurl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                
                if let jsonString = response.result.value {
                    
                    /// json转model
                    /// 写法一：responseModel.deserialize(from: jsonString)
                    /// 写法二：用JSONDeserializer<T>
                    if let responseModel = JSONDeserializer<PersonModel>.deserializeFrom(json: (jsonString as! String)) {
                        
                        /// model转json 为了方便在控制台查看
                        print(responseModel.toJSONString(prettyPrint: true)!)
                        
                        /// 遍历responseModel.data
                        responseModel.data?.forEach({ (model) in
                            print(model.nickname!);
                        })
                        
                    }
                }
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
