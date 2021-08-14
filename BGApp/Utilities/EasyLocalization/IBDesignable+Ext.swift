//
//  IBDesignable+Ext.swift
//  EasyLocalization
//
//  Created by abdelrahman on 2/9/18.
//

import Foundation
import UIKit

// MARK:- local extention for language
public extension String{
    var locale: String {
        get {
            // get value from dictionary
            for (key,value) in langs{
                if value[self] != nil  , (language == key) {
                    return value[self]!
                }
            }
            // return final value from dictionary
            return "lang.\(self)"
        }
        
    }
}

// MARK:- UILabel localize Key extention for language in story board

@IBDesignable
public extension UILabel {
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.text = newValue?.locale
                guard self.textAlignment != .center else{return}
                self.textAlignment = rtlLang.contains(language ?? .en) ? .right : .left
            }
        }
        get {
            return self.text
        }
    }
}

// MARK:- UIButton localize Key extention for language in story board

@IBDesignable
public extension UIButton {
    
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.setTitle(newValue?.locale, for: .normal)
            }
        }
        get {
            return self.titleLabel?.text
        }
    }
}

// MARK:- UITextView localize Key extention for language in story board

@IBDesignable
public extension UITextView {
    
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.text = newValue?.locale
                self.textAlignment = rtlLang.contains(language ?? .en) ? .right : .left
            }
        }
        get {
            return self.text
        }
    }
}

// MARK:- UITextField localize Key extention for language in story board

@IBDesignable
public extension UITextField {
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.placeholder = newValue?.locale
                self.textAlignment = rtlLang.contains(language ?? .en) ? .right : .left

            }
        }
        get {
            return self.placeholder
        }
    }
}

// MARK:- UINavigationItem localize Key extention for language in story board

@IBDesignable
public extension UINavigationItem {
    
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.title = newValue?.locale
            }
        }
        get {
            return self.title
            
        }
    }
}


public extension UIBarButtonItem {
    
    @IBInspectable override var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.title = newValue?.locale
            }
        }
        get {
            return " "
            
        }
    }
}
public extension UIBarItem {
    
    @IBInspectable var localizeKey: String? {
        set {
            // set new value from dictionary
            DispatchQueue.main.async{
                self.title = newValue?.locale
            }
        }
        get {
            return " "
            
        }
    }
}
