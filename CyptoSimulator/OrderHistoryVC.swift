//
//  OrderHistoryVC.swift
//  CyptoSimulator
//
//  Created by Drum, Jesse on 3/1/22.
//

import UIKit

class OrderHistoryVC: UIViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isHidden = false
        }

        // Do any additional setup after loading the view.
 
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false;

    }
    
    var wallet = Wallet()
    @IBAction func test(_ sender: Any) {
   print(wallet)
    }
    
    

}
