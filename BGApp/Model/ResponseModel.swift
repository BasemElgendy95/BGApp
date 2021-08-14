//
//  ResponseModel.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import Foundation

struct ResponseModel : Codable{
    
    let status : Int?
    let msg : String?
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
    }
}
