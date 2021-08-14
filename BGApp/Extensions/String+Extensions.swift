import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
//    subscript (i: Int) -> String {
//        return String(self[i] as Character)
//    }
    
//    subscript (r: Range<Int>) -> String {
//        let start = index(startIndex, offsetBy: r.lowerBound)
//        let end = index(startIndex, offsetBy: r.upperBound)
//        return String(self[Range(start ..< end)])
//    }
    
    var containsAlphabets: Bool {
        //Checks if all the characters inside the string are alphabets
        let set = CharacterSet.letters
        return self.utf16.contains {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        }
    }
}

// MARK: - NSAttributedString extensions
public extension String {
    
    /// Regular string.
     var regular: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Bold string.
     var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Underlined string
     var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    /// Strikethrough string.
     var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    
    /// Italic string.
     var italic: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
     func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
}

extension Array where Element: NSAttributedString {
    func joined(separator: NSAttributedString) -> NSAttributedString {
        var isFirst = true
        return self.reduce(NSMutableAttributedString()) {
            (r, e) in
            if isFirst {
                isFirst = false
            } else {
                r.append(separator)
            }
            r.append(e)
            return r
        }
    }
    
    func joined(separator: String) -> NSAttributedString {
        return joined(separator: NSAttributedString(string: separator))
    }
}

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func validPassword() -> Bool{
        if self.count >= 8{
            return true
        }
        else{
            return false
        }
    }
    var parseHtml: String {
        
        let encodedData = self.data(using: String.Encoding.utf8)!
        do {
            let x = try NSAttributedString(data: encodedData,     options: [.documentType: NSAttributedString.DocumentType.html,
                                                                            .characterEncoding: String.Encoding.utf8.rawValue],
                                           documentAttributes: nil)
            let message = x.string
            return message
        } catch let error as NSError {
            print(error.localizedDescription)
            return ""
        }
    }
    func checkCount() -> Bool{
        if self.count >= 191{
            return false
        }else{
            return true
        }
    }
    func verifyUrl () -> Bool {
        if self.range(of:".") != nil {
            return true
        }
        else{
            return false
        }
    }
    
    public func isPhone()->Bool {
        if self.isAllDigits() == true {
            let phoneRegex = "(00966)[0-9]{7}?"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: self)
        }else {
            return false
        }
    }
    public func convertToArabic()-> String {
           let numbersDictionary : Dictionary = ["0" : "۰","1" : "۱", "2" : "۲", "3" : "۳", "4" : "۴", "5" : "۵", "6" : "۶", "7" : "۷", "8" : "۸", "9" : "۹",".":","]
           var str : String = self
           
           for (key,value) in numbersDictionary {
               str =  str.replacingOccurrences(of: key, with: value)
           }
           
           return str
       }
    public func convertToEnglish()-> String {
        let numbersDictionary : Dictionary = ["٠":"0" ,"١" : "1", "٢" : "2", "٣" : "3", "٤" : "4", "٥" : "5" ,"٦":"6", "٧" : "7", "٨" : "8", "٩" : "9",",":"."]
            var str : String = self
                     
                     for (key,value) in numbersDictionary {
                         str =  str.replacingOccurrences(of: key, with: value)
                     }
                     
                     return str
       }
    private func isAllDigits()->Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    func height(withConstraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension Int {
    
    
    func  toString() -> String {
        
        return "\(self)"
        
        
    }
    
    
    
    func  toKiloString() -> String {
        
        if self < 1000 {
            
             return "\(self)"
        }
        
        let formatted = String(format: "%.1f",Double(self)/1000.0)
        
        return "\(formatted)k"
        
        
    }
    
    
}
extension String {

func fromBase64() -> String? {
    guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
        return nil
    }

    return String(data: data as Data, encoding: String.Encoding.utf8)
}

func toBase64() -> String? {
    guard let data = self.data(using: String.Encoding.utf8) else {
        return nil
    }

    return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}
extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:m:ss")-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func convertDateFormat(fromFormat : String , toFormat: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = fromFormat

         let oldDate = olDateFormatter.date(from: self)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = toFormat

         return convertDateFormatter.string(from: oldDate!)
    }
}
