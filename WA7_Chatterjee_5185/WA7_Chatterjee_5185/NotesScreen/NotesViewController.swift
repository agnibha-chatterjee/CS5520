//
//  ViewController.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/2/24.
//

import UIKit

class NotesViewController: UIViewController {
    
    let notesView = NotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = notesView
        
        self.title = "All Notes"
    
    }

}

