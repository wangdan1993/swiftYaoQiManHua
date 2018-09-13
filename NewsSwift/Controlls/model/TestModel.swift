//
//  TestModel.swift
//  NewsSwift
//
//  Created by hisilc-mac002 on 2018/9/10.
//  Copyright © 2018年 hisilc-mac002. All rights reserved.
//

import Foundation
import HandyJSON
class PersonModel: HandyJSON {
    
    var data:[TagModel]?
    var error: Int!
    
    required init() {
        
    }
}
struct TagModel: HandyJSON {
    
    var nickname: String?
    var vertical_src: String?
    var ranktype: String?
    var room_src: String?
    var cate_id: Int?
}


