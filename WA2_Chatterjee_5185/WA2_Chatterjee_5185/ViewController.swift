//
//  ViewController.swift
//  WA2_Chatterjee_5185
//
//  Created by agni on 9/15/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.addTarget(self, action: #selector(onBtnPress), for: .touchDown)
    }

    
    @objc func onBtnPress() {
        let text = textField.text
           
        if let unwrappedText = text{
               //print(unwrappedText)
               
               if(unwrappedText.isEmpty){ //The user didn't put anything...
                   showErrorAlert()
               } else{ //The user put some texts...
                   showAlertText(text: unwrappedText)
               }
           }
    }
    
    func showErrorAlert(){
        let alert = UIAlertController(
            title: "Error!", message: "Text Field must not be empty!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

    //MARK: text alert...
    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "You said:",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

}

