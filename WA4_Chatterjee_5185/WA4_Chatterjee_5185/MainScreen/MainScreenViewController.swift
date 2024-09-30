//
//  ViewController.swift
//  WA4_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    let mainScreenView = MainScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Contacts"
        self.view = mainScreenView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    @objc func onAddBarButtonTapped() {
          
    }


}

