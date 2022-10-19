//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Elyess Mahmoud on 17/10/2022.
//  Copyright © 2022 London App Brewery. 
//

import Foundation

struct CalculatorLogic {
    
    private var newValue : Double?
    
    private var intermeditCalculator : (calcOperation : String, firstValue : Double)?
    
    mutating func setNumber(_ number : Double) {
        self.newValue = number
    }
    
    mutating func calcultorLogic (sender: String) -> Double?{
        
        if let n = newValue {
            
            switch sender {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return preformTwoNumberOperation(n2 : n)
            default:
                intermeditCalculator = (calcOperation : sender, firstValue : n)
            }
        }
        return nil
    }
    
    private func preformTwoNumberOperation(n2 : Double) ->Double? {
        
        if let n1 = intermeditCalculator?.firstValue,
           let operation = intermeditCalculator?.calcOperation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("the operation passed in does not match one of the cases ")
            }
            
        }
        return nil
    }
}
