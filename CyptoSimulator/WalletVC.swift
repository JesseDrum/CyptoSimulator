//
//  WalletVC.swift
//  CyptoSimulator
//
//  Created by Drum, Jesse on 1/31/22.
//

import UIKit

class WalletVC: UIViewController,UITableViewDataSource, UITableViewDelegate{


    
    @IBOutlet weak var WalletTableView: UITableView!
//    var selectedCoin = Wallet(B: 2, P: [])


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup

        self.WalletTableView.backgroundColor = UIColor.darkGray

        WalletTableView.delegate = self
        WalletTableView.dataSource = self
        loadWalletFromUserDefaults()
        WalletTableView.reloadData()
        view.backgroundColor = UIColor.darkGray

//        do {
//            let data =  try JSONEncoder().encode(Wallet)
//        } catch {
//        print("failed to encode")
//        }
        
    }
    var wallet = Wallet()

  
    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
       self.navigationController?.setNavigationBarHidden(false, animated: true)
   }

    override func viewDidAppear(_ animated: Bool) {
        loadWalletFromUserDefaults()
        WalletTableView.reloadData()
        print(wallet.Purchases.count)
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return wallet.Purchases.count
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "walletSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "walletSegue"
        {
            var distination = segue.destination as! OrderHistoryVC
//            distination.self = selectedCoin
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wallet", for: indexPath)
        let item = wallet.Purchases[indexPath.row]
        cell.textLabel?.text = "\(item)"
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        return cell

    }

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
