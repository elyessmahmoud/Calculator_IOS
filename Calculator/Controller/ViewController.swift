//
//  ViewController.swift
//  Calculator
//
//  Created by Elyess Mahmoud on 18/10/2022.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTappingNumber: Bool = true
    
    public var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("canot covert text to value")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishTappingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            
            if let result = calculator.calcultorLogic(sender: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let entry = sender.currentTitle {
            
            if isFinishTappingNumber {
                displayLabel.text = entry
                isFinishTappingNumber = false
            } else {
                
                if entry == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {}
                    return
                }
                displayLabel.text = displayLabel.text! + entry
            }
            
        }
        
    }
    
}
