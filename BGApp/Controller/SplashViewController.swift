//
//  SplashViewController.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import UIKit

class SplashViewController: UIViewController {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        BGPermissions.manager.getPermissions(self)
        
    }
    
    
    @IBAction func start(){
        let tab = R.storyboard.home.tabBar()
        let mySceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        mySceneDelegate.window?.rootViewController = tab
    }


}
