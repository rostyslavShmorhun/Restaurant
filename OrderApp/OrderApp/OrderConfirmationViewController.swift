//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by Rostyslav Shmorhun on 19.05.2022.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    //MARK: - Properties
    let minutesToPrepare: Int
    
    //MARK: - Outlet
    @IBOutlet var confirmationLabel: UILabel!
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                   
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmationLabel.text = "Thank you for your order! Your wait time is approximately \(minutesToPrepare) minutes."
    }
}
