//
//  LocalizViewController.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import UIKit

class LocalizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeLang(){
        EasyLanguageManger().changeLanguage(self)
    }
    func reload() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController")
        let mySceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        mySceneDelegate.window?.rootViewController = newViewController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
