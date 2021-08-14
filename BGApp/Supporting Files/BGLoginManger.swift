//
//  BGLoginManger.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation

struct BGLoginManger {
    
    static let key = "user"
    
    static func saveUser(_ value: UserModel!) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    
    static func getUser() -> UserModel! {
        var userData: UserModel!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode(UserModel.self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    
    static func removeUser() {
        UserDefaults.standard.setValue(false, forKey: "isLogin")
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    static func checkUser() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLogin")
    }
}
