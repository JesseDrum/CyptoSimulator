
import Foundation
class Purchase: CustomStringConvertible, Codable
{
    var description: String {
        return "Coin: \(Cname) Amount:\(round(Camount*1000)/1000.0): \(round(PurchasePrice))"
    }
    var id: Int
    //Poperties
    var Cname: String
//    var CPrice: Double
//    var balance: Double
    var Camount: Double
    var PurchasePrice: Double
    
   
    init(theName: String, thePrice: Double, amount: Double)
    {
        self.Cname = theName
//        self.CPrice = thePrice
        self.Camount = amount
        self.PurchasePrice = thePrice
        id = UUID().hashValue

    }

    //methods
 
  
    
}

