//
//  UserModel.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/15.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel: Mappable {
    var id: Int?
    var username: String?
    var tagline: String?
    var avatar: String?
    var website: String?
    var github: String?
    var twitter: String?
    var location: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        tagline <- map["tagline"]
        avatar <- map["avatar"]
        website <- map["website"]
        github <- map["github"]
        twitter <- map["twitter"]
        location <- map["location"]
    }

}
