//
//  LangList.swift
//  EasyLocalization
//
//  Created by abdelrahman on 2/9/18.
//

import Foundation

public enum locale : String{
    case en = "en"
    case fr = "fr"
    case de = "de"
    case zhHans = "zhHans"
    case zhHant = "zhHant"
    case ja = "ja"
    case es = "es"
    case es419 = "es419"
    case it = "it"
    case nl = "nl"
    case ko = "ko"
    case ptBR = "ptBR"
    case ptPT = "ptPT"
    case da = "da"
    case fi = "fi"
    case nb = "nb"
    case sv = "sv"
    case ru = "ru"
    case pl = "pl"
    case tr = "tr"
    case ar = "ar"
    case th = "th"
    case cs = "cs"
    case hu = "hu"
    case ca = "ca"
    case hr = "hr"
    case el = "el"
    case he = "he"
    case ro = "ro"
    case sk = "sk"
    case uk = "uk"
    case id = "id"
    case ms = "ms"
    case vi = "vi"
    case hi = "hi"
    
    var locale: String {
        return self.rawValue
    }
}

var localeArr:[locale] = [
    .en,
    .fr,
    .de,
    .zhHans,
    .zhHant,
    .ja,
    .es,
    .es419,
    .it,
    .nl,
    .ko,
    .ptBR,
    .ptPT,
    .da,
    .fi,
    .nb,
    .sv,
    .ru,
    .pl,
    .tr,
    .ar,
    .th,
    .cs,
    .hu,
    .ca,
    .hr,
    .el,
    .he,
    .ro,
    .sk,
    .uk,
    .id,
    .ms,
    .vi,
    .hi
]

