//
//  BGNetworkHelper.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation
import Moya
import SystemConfiguration

struct BGNetworkHelper {
    
    static func noNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                zeroSockAddress in SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)}
        } ) else {
            return false
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags)
        {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return !(isReachable && !needsConnection)
    }
    
    static func validateResponse (response:Response) ->Bool {
        
        guard response.statusCode == BGConstants.success else{return false}
        let decoder = JSONDecoder()
        do {
            let responseModel = try decoder.decode(ResponseModel.self, from: response.data)
            switch responseModel.status {
            case BGConstants.success? :
                return true
            case BGConstants.added? , BGConstants.created?:
                BGAlertPresenter.displayToast(title: "", message: responseModel.msg ?? "", type: .success)
                return true
            case BGConstants.unprocessableEntity?:
                BGAlertPresenter.displayToast(title: "", message: responseModel.msg ?? "", type: .warning)
                return false
            case BGConstants.notFound?:
                BGAlertPresenter.displayToast(title: "", message: responseModel.msg ?? "", type: .warning)
                return false
            case BGConstants.unauthenticated?:
                BGAlertPresenter.displayToast(title: "", message: responseModel.msg ?? "", type: .error)
                return false
            case BGConstants.notActive?:
                BGAlertPresenter.displayToast(title: "", message: responseModel.msg ?? "", type: .error)
                return  false
            default:
                return false
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
        
    }
    
}
