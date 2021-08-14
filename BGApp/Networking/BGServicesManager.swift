//
//  BGServicesManager.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation
import PromiseKit
import Moya

struct BGServicesManager {
    
    static func CallApi<T: TargetType>(_ provider:MoyaProvider<T>,_ target: T) -> Promise<Any> {
        return Promise<Any> { seal in
            provider.request(target, completion: { (result) in
                switch result {
                case let .success(moyaResponse):
                    // http status code is now 200 from here on
                    if moyaResponse.statusCode == 200{
                        seal.fulfill(moyaResponse)
                    }else{
                        seal.fulfill(moyaResponse)
                    }
                case let .failure(error):
                    seal.reject(error)
                }
            })
        }
    }
}

