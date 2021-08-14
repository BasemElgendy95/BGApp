//
//  BGAlertPresenter.swift
//  JAZAN-UNI
//
//  Created by BasemElgendy on 01/06/2020.
//  Copyright © 2020 BasemElgendy. All rights reserved.
//


import UIKit
import SPIndicator



class BGAlertPresenter{
    
    // MARK: - Display alert
    
    static public func displayToast(title: String , message : String , type: SPIndicatorHaptic ){
        
        SPIndicator.present(title: title.local, message: message.local, haptic: type)
    }
    // MARK: - Display normal alert
    static public func displayAlert(title: String, message:String,doneBtn:String,forController controller:UIViewController, completion:(()  -> ())? = nil){
           var alertTitle:String?
           var alertMessage:String?
           if message == "" {
            alertMessage = R.string.localizable.error().locale
           }
           if title == "" {
               alertTitle = message
               alertMessage = ""
           }else{
               alertTitle = title
               alertMessage = message
           }
           let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: doneBtn, style: .default, handler: { (_) in
            
            completion?()
        }))
           controller.present(alert, animated: true)
           
       }
       
     
       // MARK: - Alert with sheet multi actions
     static  public func displayAlertWithSheet(selectedBtn:UIButton , controller:UIViewController , array:[Int:String] , title:String ,message:String, completion :@escaping (_ selected:Int)  -> () )
       {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            // add actions
           for ar in array
           {
               let action   = UIAlertAction(title:  ar.value, style: .default, handler: { (action) in
                   selectedBtn.setTitle(ar.value, for: .normal)
                   completion(ar.key)
               })
               alert.addAction(action)
           }
        let cancel = UIAlertAction(title: R.string.localizable.cancel().locale, style: .destructive, handler: { ( action ) in
           })
           alert.addAction(cancel)
           alert.popoverPresentationController?.sourceView = selectedBtn
           alert.popoverPresentationController?.sourceRect = selectedBtn.bounds
           controller.present(alert, animated: true, completion: nil)
           
       }
    // MARK: - Alert with sheet and UITextView
      static  public func displaySheetWithTextView(selectedBtn:UIButton , controller:UIViewController , actionTitle:String , title:String ,message:String, completion :@escaping (_ textViewString:String)  -> () )
        {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
             let action   = UIAlertAction(title:  actionTitle, style: .default, handler: { (action) in
                guard let controler = alert.value(forKey: "contentViewController") as? UIViewController else {
                    completion("")
                    return
                }
                let textView = controler.view.viewWithTag(10) as! UITextView
                 completion(textView.text)
             })
             alert.addAction(action)
            let cancel = UIAlertAction(title: R.string.localizable.cancel().locale, style: .destructive, handler: { ( action ) in
            })
            alert.setValue(addTextViewToViewController(), forKey: "contentViewController")
            alert.addAction(cancel)
            alert.popoverPresentationController?.sourceView = selectedBtn
            alert.popoverPresentationController?.sourceRect = selectedBtn.bounds
            controller.present(alert, animated: true) {
                guard let controler = alert.value(forKey: "contentViewController") as? UIViewController else {
                    completion("")
                    return
                }
                let textView = controler.view.viewWithTag(10) as! UITextView
                textView.becomeFirstResponder()
            }
            
        }
    
    private static func addTextViewToViewController() -> UIViewController {
        let textView = UITextView()
//        textView.delegate = delegate
        textView.tag = 10
        textView.backgroundColor = .clear
        textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let controller = UIViewController()
        textView.frame = controller.view.frame
        controller.view.addSubview(textView)
        return controller
    }
}
