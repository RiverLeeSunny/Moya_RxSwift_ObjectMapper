//
//  TopicModel.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/16.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import Foundation
import ObjectMapper

class TopicModel: Mappable {
    var id:Int?
    var title:String?
    var url:String?
    var content:String?
    var contentRendered:String?
    var replies:Int?
    var member:UserModel?
    var node:NoteModel?
    var created:Int32?
    var lastModified:Int32?
    var lastTouched:Int32?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
        content <- map["content"]
        contentRendered <- map["contentRendered"]
        replies <- map["replies"]
        member <- map["member"]
        node <- map["node"]
        created <- map["created"]
        lastModified <- map["lastModified"]
        lastTouched <- map["lastTouched"]
    }
}
