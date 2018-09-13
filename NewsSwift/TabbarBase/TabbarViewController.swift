//
//  TabbarViewController.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/7/20.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = FirstViewController();
        let secondVC = SecondViewController();
        let threeVC = ViewController();
        let fourVC = ThreeViewController();
        
        
        
        addOneChildViewController(VC: firstVC , s1: "首页" , s2: UIImage(named: "tab_home")!  , s3: UIImage(named: "tab_home_S")!);
        addOneChildViewController(VC: secondVC , s1: "订单" , s2: UIImage(named: "tab_class")!  , s3: UIImage(named: "tab_class_S")!);
        addOneChildViewController(VC: threeVC , s1: "列表" , s2: UIImage(named: "tab_book")!  , s3: UIImage(named: "tab_book_S")!);
        addOneChildViewController(VC: fourVC , s1: "中心" , s2: UIImage(named: "tab_mine")!  , s3: UIImage(named: "tab_mine_S")!);
        // Do any additional setup after loading the view.
    }
    func addOneChildViewController(VC : UIViewController, s1 : String, s2 : UIImage, s3 : UIImage){
        VC.title = s1;
//        VC.tabBarItem.titlePositionAdjustment = UIOffsetMake(2, -2);
//        VC.tabBarItem.image = s2;
//        VC.tabBarItem.selectedImage = s3;
//        self.tabBar.isTranslucent = false;
        
        VC.tabBarItem = UITabBarItem(title: nil,
                                     image: s2.withRenderingMode(.alwaysOriginal),
                                     selectedImage: s3.withRenderingMode(.alwaysOriginal))
        VC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)

        let baseNav = UINavigationController(rootViewController: VC);
        baseNav.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white];
        baseNav.navigationBar.barTintColor = UIColor.orange;
        baseNav.navigationBar.tintColor = UIColor.white
        baseNav.navigationBar.isTranslucent = false;
        self.addChildViewController(baseNav);
        
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
