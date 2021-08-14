//
//  UIFont+Extensions.swift
//  Fajr-Teacher
//
//  Created by BasemElgendy on 29/04/2020.
//  Copyright © 2020 BasemElgendy. All rights reserved.
//

import UIKit

struct Resources {

    struct Fonts {
        //struct is extended in Fonts
    }
}

extension Resources.Fonts {

    enum Weight: String {
        case regular = "din-next-lt-w23-regular"
        case medium = "din-next-lt-w23-medium"
        case bold = "din-next-arabic-bold"
    }
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {

    @objc class func mySystemFont(ofSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .semibold, .heavy:
            return UIFont(name: Resources.Fonts.Weight.medium.rawValue, size: ofSize)!
        case .bold :
            return UIFont(name: Resources.Fonts.Weight.bold.rawValue, size: ofSize)!
        case .medium :
            return UIFont(name: Resources.Fonts.Weight.medium.rawValue, size: ofSize)!
        case .regular :
            return UIFont(name: Resources.Fonts.Weight.regular.rawValue, size: ofSize)!
        case .black:
            return UIFont(name: Resources.Fonts.Weight.bold.rawValue, size: ofSize)!
        default:
            return UIFont(name: Resources.Fonts.Weight.regular.rawValue, size: ofSize)!
        }
    }

    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        //print("Resources.Fonts.Weight.light.rawValue99 ",Resources.Fonts.Weight.regular.rawValue)
        return UIFont(name: Resources.Fonts.Weight.regular.rawValue, size: size)!
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Resources.Fonts.Weight.medium.rawValue, size: size)!
    }

    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Resources.Fonts.Weight.medium.rawValue, size: size)!
    }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
//                self.init(myCoder: aDecoder)
                let fontDescriptors = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor
            if let fontName = fontDescriptors?.fontAttributes[.name] as? String , fontName.contains("DINNextLTW23"){
                     self.init(myCoder: aDecoder)
                }else{
                    self.init(name: Resources.Fonts.Weight.bold.rawValue, size: fontDescriptors!.pointSize)!
                }
                return
        }
        var fontName = ""
       // print(fontAttribute)
        switch fontAttribute {
       case "CTFontObliqueUsage":
            fontName = Resources.Fonts.Weight.medium.rawValue
        case "CTFontSemiboldUsage","CTFontHeavyUsage":
            fontName = Resources.Fonts.Weight.medium.rawValue
        case "CTFontBoldUsage" :
            fontName = Resources.Fonts.Weight.bold.rawValue
        case "CTFontRegularUsage", "CTFontMediumUsage":
               fontName = Resources.Fonts.Weight.regular.rawValue
        case "CTFontBlackUsage":
               fontName = Resources.Fonts.Weight.bold.rawValue
        default:
                fontName = Resources.Fonts.Weight.regular.rawValue
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    class func overrideDefaultTypography() {
        guard self == UIFont.self else { return }

        if let systemFontMethodWithWeight = class_getClassMethod(self, #selector(systemFont(ofSize: weight:))),
            let mySystemFontMethodWithWeight = class_getClassMethod(self, #selector(mySystemFont(ofSize: weight:))) {
            method_exchangeImplementations(systemFontMethodWithWeight, mySystemFontMethodWithWeight)
        }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
