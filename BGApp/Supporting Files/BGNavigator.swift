//
//  BGNavigator.swift
//  Amrk-representative
//
//  Created by BasemElgendy on 23/06/2021.
//

import UIKit


class BGNavigator {
    
    static func rootNavigation(newViewController: UIViewController , from : UIViewController){
        DispatchQueue.main.async {
            let mySceneDelegate = from.view.window?.windowScene?.delegate as! SceneDelegate
            mySceneDelegate.window?.rootViewController = newViewController
        }
    }
    
    static func pushNavigation(storyboardName: String , withIdentifier : String , from : UIViewController){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: storyboardName, bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: withIdentifier)
        from.navigationController?.pushViewController(newViewController, animated: true)
        
    }

    static func presentNavigation(storyboardName: String , withIdentifier : String , from : UIViewController){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: storyboardName, bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: withIdentifier)
        from.present(newViewController, animated: true, completion: nil)
        
    }
    
    static func backNavigation(from : UIViewController){
        from.navigationController?.popViewController(animated: true)
    }
    
    static func backNavigation(storyboardName: String , withIdentifier : String ,from : UIViewController){
        let storyBoard : UIStoryboard = UIStoryboard(name: storyboardName, bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: withIdentifier)
        from.navigationController?.popToViewController(newViewController, animated: true)
    }
    
    static func dismissNavigation(from : UIViewController , completion : (() -> Void)?){
        from.dismiss(animated: true, completion: completion)
    }
}
