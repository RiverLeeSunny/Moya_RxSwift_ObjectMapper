//
//  Observable+ObjectMapper.swift
//  RxSwiftMoya
//
//  Created by Chao Li on 9/20/16.
//  Copyright © 2016 ERStone. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

extension Observable {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            /*as？为类型转换，如果response不可转换成[String:Any]字典类型response as? [String: Any]这个语句会返回nil那么会抛出RxSwiftMoyaError.ParseJSONError异常*/
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            /*as?类型转换，第一步判断response是否可以转换成[Any]对象数组RxSwiftMoyaError.ParseJSONError转换失败返回nil抛出RxSwiftMoyaError.ParseJSONError*/
            guard let array = response as? [Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            /*as?类型转换，第二步判断response是否可以转换成[[String: Any]]字典对象数组RxSwiftMoyaError.ParseJSONError转换失败返回nil抛出RxSwiftMoyaError.ParseJSONError*/
            guard let dicts = array as? [[String: Any]] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            return Mapper<T>().mapArray(JSONArray: dicts)
        }
    }
}

enum RxSwiftMoyaError: String {
    case ParseJSONError
    case OtherError
}

extension RxSwiftMoyaError: Swift.Error { }
