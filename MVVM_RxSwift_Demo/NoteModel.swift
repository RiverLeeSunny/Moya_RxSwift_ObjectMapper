//
//  NoteModel.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/15.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import Foundation
import ObjectMapper

class NoteModel: Mappable {
    
    var id:Int?
    var name:String?
    var title:String?
    var titleAlternative:String?
    var url:String?
    var topics:Int?
    var header:String?
    var footer:String?
    var isCollected:Bool?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        title <- map["title"]
        titleAlternative <- map["titleAlternative"]
        url <- map["url"]
        topics <- map["topics"]
        header <- map["header"]
        footer <- map["footer"]
        isCollected <- map["isCollected"]
    }

    
}
