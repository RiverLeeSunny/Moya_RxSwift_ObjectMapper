//
//  UserViewModel.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/15.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import RxSwift

class UserViewModel {
    
    func login(username:String,password:String) -> Observable<[TopicModel]> {
        return netApi.request(.Login(username: username, password: password))
                .filterSuccessfulStatusCodes()
                .mapJSON()
                .mapArray(type: TopicModel.self)
    }
    
//    func login(username:String,password:String){
//         netApi.request(.Login(username: username, password: password)){ result in
//            var message = "Couldn't access API"
//            if case let .success(response) = result {
//                let jsonString = try? response.mapString()
//                message = jsonString ?? message
//                let topicModels:[TopicModel] = Mapper<TopicModel>().mapArray(JSONString: message)!
//                print("message = ",topicModels[1].content ?? "kskskskk")
//            }
//        }
//    }
}
