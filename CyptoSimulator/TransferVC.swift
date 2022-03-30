//
//  TransferVC.swift
//  CyptoSimulator
//
//  Created by Drum, Jesse on 1/25/22.
//
import UIKit

class TransferVC: UIViewController {

    
//    var history: [String] = []
    var walletNonDuplicate: [String] = []
    var wallet = Wallet()
    
//    let checkName = Dictionary(grouping: wallet.Purchases, by: \.Cname)

    

    
    var coin = Coin(name: "coin", price: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        print(coin)
//        var textFieldAmount = Double(enterAmount.text!)


   
        
        loadWalletFromUserDefaults()
        nameCT.text = coin.name
        priceCT.text = "$\((round(1000*coin.price)/1000))"
        myAmount.text = "Wallet: $\((round(1000*wallet.balance)/1000))"
    }
    

    @IBOutlet weak var myAmount: UILabel!
    @IBOutlet weak var nameCT: UILabel!
    
    @IBOutlet weak var priceCT: UILabel!
    @IBOutlet weak var enterAmount: UITextField!

    
    @IBAction func buyButton(_ sender: Any) {
        if let amt = Double(enterAmount.text!)
        {
            
            // figure out how many crypto you can buy for the amount in usd
            let totalC = amt/coin.price
            let theCoin = Purchase(theName: coin.name, thePrice: coin.price, amount: totalC  )
            // figure out if you have enough money
//            if wallet.balance >= theCoin.Camount*theCoin.PurchasePrice
            if wallet.balance >= amt
                {
                
                BuyConfirmAlert(theCoin: theCoin)
            
                
             }
            // make alert and display congrats you bought coin. then dismiss to history...
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Check Your Balance", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        

        print(wallet.Purchases)
        print("your balance: \(wallet.balance)")
      
        
    }
    
    @IBAction func sellButton(_ sender: Any) {
        let AmtC = Double(enterAmount.text!)
        
        
    }
          
    
    func BuyConfirmAlert(theCoin: Purchase)
    {
        // Create Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to buy this?", preferredStyle: .alert)

        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.wallet.Purchases.append(theCoin)
                
            self.wallet.balance -= theCoin.Camount*theCoin.PurchasePrice
            self.myAmount.text = "Wallet: $\((round(1000*self.wallet.balance)/1000))"
            print(self.wallet.Purchases)
            
            self.saveWalletToUserDefaults()
            
           
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }

        //Add OK and Cancel button to an Alert object
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)

        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    
    }
    
//    func SellConfirmAlert(theCoin: Purchase)
//    {
//        // Create Alert
//        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to sell this?", preferredStyle: .alert)
//
//        // Create OK button with action handler
//        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
//            print("Ok button tapped")
//
//
//            self.wallet.Purchases.remove(at: )
//
//            self.wallet.balance += Double(theCoin.Camount*self.coin.price)
//            self.myAmount.text = "Wallet: $\(<#Any.Type#>)"
//            print(self.wallet.Purchases)
//            self.saveWalletToUserDefaults()
//
//        })
//
//        // Create Cancel button with action handlder
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
//            print("Cancel button tapped")
//        }
//
//        //Add OK and Cancel button to an Alert object
//        dialogMessage.addAction(ok)
//        dialogMessage.addAction(cancel)
//
//        // Present alert message to user
//        self.present(dialogMessage, animated: true, completion: nil)
//    }
//
//
//
    
    
    func saveWalletToUserDefaults()
    {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(wallet)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "wallet")

        } catch {
            print("Unable to Encode Wallet (\(error))")
        }
    }
    
    func loadWalletFromUserDefaults()
    {
        if let data = UserDefaults.standard.data(forKey: "wallet") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                self.wallet = try decoder.decode(Wallet.self, from: data)

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        else {
            wallet = Wallet()
        }
    }
    
    
    
}
