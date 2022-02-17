//
//  ViewController.swift
//  Calculator
//
//  Created by mac12 on 2022/2/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var InTheMiddleOfTyping = false
    var IsFloating = false
    
    var operand1 = 0.0
    var SymbolOfOperation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if digit == "." {
            InTheMiddleOfTyping = true
        }
        
        if !(IsFloating && digit == ".") {
            if InTheMiddleOfTyping {
                let textCurrentlyInDisplay = display.text!
                display.text = textCurrentlyInDisplay + digit
            } else {
                display.text = digit
                InTheMiddleOfTyping = true
            }
        }
        
        if digit == "." {
            IsFloating = true
        }
        
    }
    @IBAction func performOperation(_ sender: UIButton) {
        let Operation = sender.currentTitle!
        switch Operation {
        case "AC":
            display.text = "0"
            InTheMiddleOfTyping = false
        case "√":
            let operand = Double(display.text!)!
            display.text = String(sqrt(operand))
            InTheMiddleOfTyping = false
        case "+":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            SymbolOfOperation = "+"
        case "-":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            SymbolOfOperation = "-"
        case "x":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            SymbolOfOperation = "x"
        case "÷":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            SymbolOfOperation = "÷"
        case "%":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            SymbolOfOperation = "%"
        case "±":
            let operand = Double(display.text!)!
            display.text = String(-operand)
        case "=":
            print("=" + "\(operand1) and \(display.text!) and \(SymbolOfOperation)")
            if (SymbolOfOperation != "") {
                let operand2 = Double(display.text!)!
                switch SymbolOfOperation {
                case "+":
                    display.text = String(operand1 + operand2)
                case "-":
                    display.text = String(operand1 - operand2)
                case "x":
                    display.text = String(operand1 * operand2)
                case "÷":
                    display.text = String(operand1 / operand2)
                case "%":
                    display.text = String(Int(operand1) % Int(operand2))
                default:
                    break
                }
                InTheMiddleOfTyping = false
                SymbolOfOperation = ""
            }
        default:
            break
        }
        
    }
    
}

