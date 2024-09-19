//
//  ViewController.swift
//  WA2_Chatterjee_5185
//
//  Created by agni on 9/15/24.
//

import UIKit

enum MathOperator {
    case add, subtract, multiply, divide
}

class ViewController: UIViewController {
    
    @IBOutlet var firstNumberTextField: UITextField!
    @IBOutlet var secondNumberTextField: UITextField!
    
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnSubract: UIButton!
    @IBOutlet var btnMultiply: UIButton!
    @IBOutlet var btnDivide: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNumberTextField.keyboardType = .decimalPad
        secondNumberTextField.keyboardType = .decimalPad
        
        btnAdd.addTarget(self, action: #selector(handleBtnAddPress), for: .touchUpInside)
        btnSubract.addTarget(self, action: #selector(handleBtnSubtractPress), for: .touchUpInside)
        btnMultiply.addTarget(self, action: #selector(handleBtnMultiplyPress), for: .touchUpInside)
        btnDivide.addTarget(self, action: #selector(handleBtnDividePress), for: .touchUpInside)
    }
    
    func showAlert(text: String) {
        let alert = UIAlertController(
            title: "Error",
            message: text,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alert, animated: true)
    }

    func validateInputs() -> Bool {
        if let firstNumberText = firstNumberTextField.text {
            if firstNumberText.isEmpty {
                showAlert(text: "First number cannot be empty")
                return false
            }
        }
        
        if let secondNumberText = secondNumberTextField.text {
            if secondNumberText.isEmpty {
                showAlert(text: "Second number cannot be empty")
                return false
            }
        }
        
        return true
    }

    func getParsedInputs() -> (Double, Double)? {
        if let firstNumberText = firstNumberTextField.text,
           let secondNumberText = secondNumberTextField.text {
            
            if let firstNumber = Double(firstNumberText),
               let secondNumber = Double(secondNumberText) {
                return (firstNumber, secondNumber)
            } else {
                showAlert(text: "Inputs must be numbers")
            }
        }
        
        return nil
    }

    func performOperation(op: MathOperator) -> Double? {
        if !validateInputs() {
            return nil
        }
        
        if let (firstNumber, secondNumber) = getParsedInputs() {
            switch op {
            case .add:
                return firstNumber + secondNumber
            case .subtract:
                return firstNumber - secondNumber
            case .multiply:
                return firstNumber * secondNumber
            case .divide:
                if secondNumber == 0 {
                    showAlert(text: "Cannot divide by zero")
                    return nil
                }
                return firstNumber / secondNumber
            }
        }
        
        return nil
    }

    func displayResult(_ result: Double?) {
        if result == nil {
            showAlert(text: "Unexpected error!")
            return
        }
           
        resultLabel.text = String(format: "%.2f", result!)
    }

    
    @objc func handleBtnAddPress() {
        let additionResult = performOperation(op: .add)
        displayResult(additionResult)
    }
    
    @objc func handleBtnSubtractPress() {
        let subtractionResult = performOperation(op: .subtract)
        displayResult(subtractionResult)
    }
    
    @objc func handleBtnMultiplyPress() {
        let multiplicationResult = performOperation(op: .multiply)
        displayResult(multiplicationResult)
    }
    
    @objc func handleBtnDividePress() {
        let divisionResult = performOperation(op: .divide)
        displayResult(divisionResult)
    }

}

