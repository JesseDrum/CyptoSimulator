//
//  ViewController.swift
//  CyptoSimulator
//
//  Created by Drum, Jesse on 12/13/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var coins = [Coin]()
    var selectedCoin: Coin = Coin(name: "Jesse", price: 1)
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self,        forCellReuseIdentifier: CryptoTableViewCell.identifier )
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto Tracker"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let Caller = APICaller.shared.getAllCryptoData(completion:{
//            result in
////            self.coins = result[0] as? [Coin] ?? [Coin]()
//
//        })
//        let Caller = APICaller.shared.getAllCryptoData { (result) in
//
//        }
        
        
        guard let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/" + "?apikey=" + "C120E6F5-11DD-48D4-8715-E9734B5D56ED") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String: Any]]
                print(json)

                for C in json
                {
//                    print(C["asset_id"] ?? "no asset_id")
//                    print(C["price_usd"] ?? "no price_usd")
                    let name = C["asset_id"] as? String
                    let price = C["price_usd"] as? Double
                    if let n = name, let p = price
                    {
                        let coin = Coin(name: n, price: p)
                        self.coins.append(coin)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                   
                }
                
            }
            catch{
                print("error")
            }
        }
        task.resume()
    
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else{
                fatalError()
            }
        let coin = coins[indexPath.row]
//        cell.textLabel?.text = coin.name + "\t $\(coin.price)"
        
        
        cell.textLabel?.text = coin.name + "\t\t $\((round(1000*coin.price)/1000))"

        
//        cell.detailTextLabel?.text = "$\(coin.price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCoin = coins[indexPath.row]
        
        performSegue(withIdentifier: "cryptoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cryptoSegue"
        {
            let distination = segue.destination as! TransferVC
            distination.coin = selectedCoin
        }
    }
 
    
}


