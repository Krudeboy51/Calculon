//
//  CalculatorViewController.swift
//  calculon
//
//  Created by Kory E King on 10/14/16.
//  Copyright © 2016 Kory E King. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    var model = CalculatorModel()
    @IBOutlet weak var display: UILabel!
    
    func updateScreen(){
        display.text = model.getDisplayNum()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateScreen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func decimalPressed(sender: AnyObject) {
        model.decimal()
        updateScreen()
    }
    
    
    @IBAction func numberPressed(sender: UIButton) {
        if let buttonpressed = sender as? UIButton { //checks if sender is a UIButton ad places into variable
            let labeltotxt = buttonpressed.currentTitle!
            let labeltxttonum = Int(labeltotxt)!
            model.numberPressed(labeltxttonum)
            updateScreen()
        }
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        model.clear()
        updateScreen()
    }
    
    @IBAction func Operation(sender: UIButton) {
        let labeltotxt:String! = sender.currentTitle
        switch labeltotxt {
        case "+":
            model.methodPressed(.Plus)
        case "-":
            model.methodPressed(.Minus)
        case "*":
            model.methodPressed(.Multiply)
        case "/":
            model.methodPressed(.Divide)
        case "=":
            model.methodPressed(.Equal)
        default:
            updateScreen()
        }
        updateScreen()
    }
    
}