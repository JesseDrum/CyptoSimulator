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
    var id: Int
    var Purchases = [Purchase]()
    var balance: Double
   
    //Initializer
    init()
    {
      balance = 10000
        id = UUID().hashValue
    }
   
    init(B: Double, P: [Purchase] )
    {
        self.balance = B
        self.Purchases = P
        id = UUID().hashValue

    }


    

    
    
}

