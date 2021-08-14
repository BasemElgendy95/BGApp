//
//  UserModel.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation
struct UserDataModel : Codable{
    
    let data : UserModel?
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
}

struct UserModel : Codable{
    let id : Int?
    let f_name : String?
    let l_name : String?
    let name : String?
    let email : String?
    let phone : String?
    let jwt : String?
    let city_id : Int?
    let user_code : String?
    let active : Int?
    let accept : Int?
    let verified : Int?
    let suspend : Int?
    let online : Int?
    let rate : Int?
    let files_completed : Int?
    let near_orders : Bool?
    let country_id : Int?
    let lat : String?
    let lng : String?
    let token : String?
    let wallet : Int?
    let points : Int?
    let wallet_flag : Int?
    let notification_flag : Int?
    let promo_code : String?
    let bank_name : String?
    let bank_account_name : String?
    let bank_account_num : String?
    let car_color : String?
    let car_num : String?
    let car_text : String?
    let car_level : Int?
    let national_id : String?
    let national_id_type : String?
    let image : String?
    let gender : Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case f_name = "f_name"
        case name = "name"
        case l_name = "l_name"
        case email = "email"
        case phone = "phone"
        case jwt = "jwt"
        case city_id = "city_id"
        case user_code = "user_code"
        case active = "active"
        case accept = "accept"
        case verified = "verified"
        case suspend = "suspend"
        case online = "online"
        case rate = "rate"
        case files_completed = "files_completed"
        case near_orders = "near_orders"
        case country_id = "country_id"
        case lat = "lat"
        case lng = "lng"
        case token = "token"
        case wallet = "wallet"
        case points = "points"
        case wallet_flag = "wallet_flag"
        case notification_flag = "notification_flag"
        case promo_code = "promo_code"
        case bank_name = "bank_name"
        case bank_account_name = "bank_account_name"
        case bank_account_num = "bank_account_num"
        case car_color = "car_color"
        case car_num = "car_num"
        case car_text = "car_text"
        case car_level = "car_level"
        case national_id = "national_id"
        case national_id_type = "national_id_type"
        case image = "image"
        case gender = "gender"
    }
}
