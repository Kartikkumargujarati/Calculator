//
//  ViewController.swift
//  Calculator
//
//  Created by Kartik on 10/7/16.
//  Copyright © 2016 Kartik. All rights reserved.
//

import UIKit

enum mode{
    case Not_Set
    case Mod
    case Div
    case Mul
    case Minus
    case Add
}

class ViewController: UIViewController {
    
    var stringLabel:String = ""
    var savedNum:Int = 0
    var currentMode:mode = mode.Not_Set
    var lastBwasMode:Bool = false
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func acB(_ sender: AnyObject) {
        resultLabel.text = "0"
        stringLabel = ""
        currentMode = mode.Not_Set
        savedNum = 0
    }

    @IBAction func nineB(_ sender: AnyObject) {
        bPressed(num: 9)
    }
    @IBAction func eightB(_ sender: AnyObject) {
        bPressed(num: 8)

    }
    @IBAction func sevenB(_ sender: AnyObject) {
        bPressed(num: 7)

    }
    @IBAction func sixB(_ sender: AnyObject) {
        bPressed(num: 6)

    }
    @IBAction func fiveB(_ sender: AnyObject) {
        bPressed(num: 5)

    }
    @IBAction func fourB(_ sender: AnyObject) {
        bPressed(num: 4)

    }
    @IBAction func threeB(_ sender: AnyObject) {
        bPressed(num: 3)

    }
    @IBAction func twoB(_ sender: AnyObject) {
        bPressed(num: 2)

    }
    @IBAction func oneB(_ sender: AnyObject) {
        bPressed(num: 1)

    }
    @IBAction func zeroB(_ sender: AnyObject) {
        bPressed(num: 0)

    }
    @IBAction func dotB(_ sender: AnyObject) {
        guard let tempInt:Int = Int(".") else{
            return
        }
        bPressed(num: tempInt)
    }
    @IBAction func modB(_ sender: AnyObject) {
        lastBwasMode(newMode: mode.Mod)
    }
    @IBAction func divB(_ sender: AnyObject) {
        lastBwasMode(newMode: mode.Div)
    }
    @IBAction func multiB(_ sender: AnyObject) {
        lastBwasMode(newMode: mode.Mul)
    }
    @IBAction func minusB(_ sender: AnyObject) {
        lastBwasMode(newMode: mode.Minus)
    }
    @IBAction func plusB(_ sender: AnyObject) {
        lastBwasMode(newMode: mode.Add)
    }
    @IBAction func equalB(_ sender: AnyObject) {
        guard let num:Int  = Int(stringLabel) else{
            return
        }
        if currentMode == mode.Not_Set || lastBwasMode{
            return
        }
        if currentMode == mode.Add{
            savedNum = savedNum + num
        }else if currentMode == mode.Div{
            savedNum = savedNum / num
        }else if currentMode == mode.Minus{
            savedNum = savedNum - num
        }else if currentMode == mode.Mod{
            savedNum = savedNum % num
        }else if currentMode == mode.Mul{
            savedNum = savedNum * num
        }
        currentMode = mode.Not_Set
        stringLabel = "\(savedNum)"
        updateResult()
        lastBwasMode = true
    }
    
    func bPressed(num:Int){
        if lastBwasMode{
            lastBwasMode = false
            stringLabel = ""
        }
        
        stringLabel = stringLabel.appending("\(num)")
        updateResult()
        
    }
    
    func updateResult(){
        
        guard let labelInt:Int = Int(stringLabel) else{
            resultLabel.text = "Incorrect Number"
            return
        }
        if currentMode == mode.Not_Set{
            savedNum = labelInt
        }
        resultLabel.text = "\(labelInt)"

    }
    
    func lastBwasMode(newMode:mode) {
        if savedNum == 0{
            return
        }
        currentMode = newMode
        lastBwasMode = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

