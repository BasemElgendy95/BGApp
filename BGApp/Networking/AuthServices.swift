//
//  AuthServices.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import Foundation
import Foundation
import Moya

enum AuthServices {
    case login(parameters: [String:Any])
}

extension AuthServices: URLRequestBuilder {
    
    var path: String {
        switch self {
        case .login(_):
            return EndPoints.login.rawValue
        }
        
    }
    var method: Moya.Method {
        switch self {
        case .login(_):
            return .post
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let param):
            return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }
    
}
