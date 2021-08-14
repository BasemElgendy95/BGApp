//
//  GEOServices.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation
import Moya

enum GEOServices {
    case countries
}

extension GEOServices: URLRequestBuilder {
    
    var path: String {
        switch self {
        case .countries:
            return EndPoints.countries.rawValue
        }
        
    }
    var method: Moya.Method {
        switch self {
        case .countries:
            return .get
        }
    }
    
    
    var sampleData: Data {

        return Data()
    }
    
    var task: Task {
        switch self {
        case .countries:
            return .requestPlain
//        case .techSupport(let name,let email,let phone,let notes):
//            return .requestParameters(parameters: ["name": name,"email": email,"phone": phone,"notes": notes], encoding: JSONEncoding.default)
        }
    }
    
}
