//
//  PostViewController.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import UIKit
import Moya
import PromiseKit

class PostViewController: UIViewController {

    private let authServices = MoyaProvider<AuthServices>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginUser(parameters: ["phone":"201002512011","password":"12345678g","token":"to"])
    }
    
    private func loginUser(parameters : [String:Any]){
        firstly { () -> Promise<Any> in
            BGLoading.showLoading(view)
            return BGServicesManager.CallApi(self.authServices,AuthServices.login(parameters: parameters))
        }.done({ response in
            let result = response as! Response
            guard BGNetworkHelper.validateResponse(response: result) else{return}
            let userData : UserDataModel = try BGDecoder.decode(data: result.data)
            BGLoginManger.saveUser(userData.data!)
        }).ensure {
            BGLoading.dismissLoading()
            BGAlertPresenter.displayAlert(title: "", message: "\(BGLoginManger.getUser()!)", doneBtn: "done", forController: self )
        }.catch { (error) in
            print(error)
        }
    }

}
