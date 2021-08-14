//
//  URLRequestBuilder.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation
import Moya

protocol URLRequestBuilder: TargetType {
    
    var baseURL: URL { get }
    
    var requestURL: URL { get }
    
    // MARK: - Path
    var path: String { get }
    
    var headers: [String: String]? { get }
    
    // MARK: - Methods
    var method: Moya.Method { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
    
    var deviceId: String { get }
}

extension URLRequestBuilder {
    var baseURL: URL {
        return URL(string: BGConstants.apiURL)!
    }
    
    var requestURL: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var headers: [String: String]? {
        var header = [String: String]()
        header["Content-Type"] = "application/json"
        header["Accept"] = "application/json"
        //header["Authorization"] = "\(BGLoginManger.getUser().jwt ?? "")"
        header["Accept-Language"] = Bundle.main.preferredLocalizations.first
        return header
    }
    
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers?.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
    var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    

    
}
