//
//  NetAPI.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/15.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Alamofire



enum NetAPI{
    case Login(username:String,password:String)
}

extension NetAPI:TargetType{
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    
    var baseURL: URL {
        return URL(string: BaseUrl)!
    }
    
    var path: String {
        switch self {
        case .Login(_,_):
            return "/topics/hot.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .Login(_,_):
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        /*
         * 正常请求需要参数时，可写成
         * case .Login(let username,let password):
         *     return ["username": username, "password": password]
         */
        case .Login(_,_):
            return nil
        }
    }
    
    var sampleData: Data {
        switch self {
        case .Login(_,_):
            return "Login successfully".data(using: String.Encoding.utf8)!

        }
    }
    
    var task: Task {
        return .request
    }
    
    var validate: Bool {
        return false
    }
    
}

let netApi = RxMoyaProvider<NetAPI>()

