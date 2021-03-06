import UIKit


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    var toString:String {
        if self.isInt {
            return "\(String(format: "%.0f", self))"
        }
        else{
            return "\(self.rounded(toPlaces: 2))"
        }
    }
    var isInt: Bool {
        return floor(self) == self
    }
    
}
