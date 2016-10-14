//
//  CalculatorModel.swift
//  calculon
//
//  Created by Kory E King on 10/14/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import Foundation


//Operations for calculator

enum CalculatorOperation{
    case Plus
    case Minus
    case Multiply
    case Divide
    case Equal
    case None
}

class CalculatorModel{
    
    var dispNum = "0.0"         //number to display on screen
    var Total = 0.0             //current total
    var currentOperation:CalculatorOperation = .None    //current operation to be done
    var clearDispForNxtNum = true   //whether to clear screen on next number pressed or not
    
    func getDisplayNum() -> String {
        return dispNum
    }
    
    func methodPressed(operation:CalculatorOperation){
        if !clearDispForNxtNum {
            let numfromDisp: Double! = Double(dispNum)  //grabs number shown on screen and cast to Double
            switch currentOperation {
            case .Plus:
                Total += numfromDisp
            case .Minus:
                Total -= numfromDisp
            case .Divide:
                Total /= numfromDisp
            case .Multiply:
                Total *= numfromDisp
            case .None:
                Total = numfromDisp
            default:
                break
            }
        }
        dispNum = "\(Total)"
        currentOperation = operation
        clearDispForNxtNum = true
    }
    
    func numberPressed(num: Int){
        if clearDispForNxtNum {
            if currentOperation == .Equal{
                clear()
            }
            dispNum = "\(num)"
        }else{
            dispNum += "\(num)"
        }
        clearDispForNxtNum = false
    }
    
    func decimal(){
        if clearDispForNxtNum {
            dispNum = "0."
            currentOperation = .None
        } else {
            if !dispNum.containsString(".") {
                dispNum += "."
            }
        }
        clearDispForNxtNum = false
    }
    
    func clear(){
        dispNum = "0.0"
        Total = 0.0
        currentOperation = .None
        clearDispForNxtNum = true
    }
    
}