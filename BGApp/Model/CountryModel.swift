//
//  File.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation


struct CountryDataModel : Codable {
    let data : [CountryModel]?
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct CountryModel : Codable {
    
    let id : Int?
    let nameAr : String?
    let nameEn : String?
    let code : String?
    let codeName : String?
    let currency : String?
    let timeZone : String?
    let pricePerKilo : Double?
    let image : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nameAr = "name"
        case nameEn = "name_en"
        case code = "code"
        case codeName = "code_name"
        case currency = "currency"
        case timeZone = "time_zone"
        case pricePerKilo = "price_per_kilo"
        case image = "image"
    }
    
}
