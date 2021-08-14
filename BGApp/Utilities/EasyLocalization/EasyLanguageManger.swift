//
//  EasyLanguageManger.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import Foundation
import UIKit


class EasyLanguageManger {
    
    // ChangeLanguage Func
    public func changeLanguage(_ View: UIViewController){
        let popUpTilte   = R.string.localizable.pop_up_tilte().locale
        let arabicTitle  = R.string.localizable.arabic_title().locale
        let englishTitle = R.string.localizable.english_title().locale
        let cancelTitle  = R.string.localizable.cancel_title().locale
        let actionSheet =  UIAlertController(title: nil, message: popUpTilte, preferredStyle: UIAlertController.Style.actionSheet)
        let cancelAction = UIAlertAction(title:cancelTitle, style: UIAlertAction.Style.cancel, handler: nil)
        let arabicAction = UIAlertAction(title: arabicTitle, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            if EasyLocalization.getLanguage() != .ar {
                EasyLocalization.setLanguage(.ar)
                self.changeToLanguage("ar", View)
            }
        })
        
        let englishAction = UIAlertAction(title: englishTitle, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            if EasyLocalization.getLanguage() != .en {
                EasyLocalization.setLanguage(.en)
                self.changeToLanguage("en", View)
            }
            
            
        })
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(arabicAction)
        actionSheet.addAction(englishAction)
        View.present(actionSheet, animated: true, completion: nil)
        
    }
    func reload(controller: UIViewController) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController")
        let mySceneDelegate = controller.view.window?.windowScene?.delegate as! SceneDelegate
        mySceneDelegate.window?.rootViewController = newViewController
    }
    
    // ChangeLanguage Func
    private func changeToLanguage (_ langCode: String, _ View: UIViewController) {
        UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        let restartTilte = R.string.localizable.app_resart_required().locale
        let restart = R.string.localizable.lang_body().locale
        let close = R.string.localizable.close_now().locale
        let cancel = R.string.localizable.cancel().locale
        
        let confirmAlertCtrl = UIAlertController(title: restartTilte, message: restart, preferredStyle:.alert)
        let confirmAction = UIAlertAction(title: close, style: .destructive) { _ in exit(0)}
        let cancelAction = UIAlertAction(title: cancel, style: .cancel) { [self] _ in
            reload(controller: View)
        }
        confirmAlertCtrl.addAction(confirmAction)
        confirmAlertCtrl.addAction(cancelAction)
        View.present(confirmAlertCtrl, animated: true, completion: nil)
        
    }
    
}


