//
//  Wallet.swift
//  CyptoSimulator
//
//  Created by Drum, Jesse on 1/26/22.
//
//
//import Foundation
import Foundation
class Wallet: Codable
{
    //Poperties
    var description: String {
        return "Wallet: \(Wallet.init(B: balance, P: Purchases))"
    }
    var id: Int
    var Purchases = [Purchase]()
    var balance: Double
    
    var combinedPurchases: [Purchase] {
        
        
        var newPurchases = [Purchase]()
        // figure out this magic
        for index in Purchases.indices {
            // check if I already have this name in new purchases. add it to the name, else make a new purchase
            if newPurchases.contains(where: {$0.Cname == Purchases[index].Cname})
            {
                
            }
            else
            {
                let newPurch = Purchase(theName: Purchases[index].Cname, thePrice: <#T##Double#>, amount: <#T##Double#>)
            }
        }
        
        
        return newPurchases
    }
   
    
    //Initializer
    init()
    {
      balance = 10000
        id = UUID().hashValue
    }
   
    init(B: Double, P: [Purchase])
    {
        
        self.balance = B
        self.Purchases = P
        id = UUID().hashValue

    }
    
    
    

    
    
}

