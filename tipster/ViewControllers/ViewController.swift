//
//  ViewController.swift
//  tipster
//
//  Created by Micah Chiang on 1/12/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit
import Foundation
import Darwin

class ViewController: UIViewController {
    ///These are the percentage values at the top of UI
    @IBOutlet weak var lowTipValue: UILabel!
    @IBOutlet weak var midTipValue: UILabel!
    @IBOutlet weak var highTipValue: UILabel!
    ///These are the tip values in dollars
    @IBOutlet weak var lowTipAmount: UILabel!
    @IBOutlet weak var midTipAmount: UILabel!
    @IBOutlet weak var highTipAmount: UILabel!
    ///These are total value displays for tips + bill total
    @IBOutlet weak var lowTipFinalTotal: UILabel!
    @IBOutlet weak var midTipFinalTotal: UILabel!
    @IBOutlet weak var highTipFinalTotal: UILabel!
    //Bill Total Value Display
    @IBOutlet weak var billDisplay: UILabel!
    //Group Size Number Display
    @IBOutlet weak var groupSizeNumber: UILabel!
    
    var lowTipNum: Double = 10
    var midTipNum: Double = 15
    var highTipNum: Double = 20
    
    
    
    var userAddingTotalAmount = false
    
    var billTotal:Double{
        get {
            return NSNumberFormatter().numberFromString(billDisplay.text!)!.doubleValue
        }
    }
    
///FUNCTION FOR RESETTING ALL THE THINGS
    @IBAction func resetButtonPressed(sender: UIButton) {
        userAddingTotalAmount = false
        billDisplay.text = "0"
        lowTipAmount.text = "0"
        midTipAmount.text = "0"
        highTipAmount.text = "0"
        lowTipFinalTotal.text = "0"
        midTipFinalTotal.text = "0"
        highTipFinalTotal.text = "0"
    }
///FUNCTION FOR DOING ALL THE THINGS (pertaining to getting tip amounts ect)
    @IBAction func addDigitToTotal(sender: UIButton) {
        let digit = sender.currentTitle!
        if userAddingTotalAmount {
            billDisplay!.text! += digit
        } else {
            billDisplay.text = digit
            userAddingTotalAmount = true
        }
        getLowTipTotal(lowTipNum, billTotal: billTotal)
        getMidTipTotal(midTipNum, billTotal: billTotal)
        getHighTipTotal(highTipNum, billTotal: billTotal)
    }
    

///FUNCTIONS THAT CALCULATE TIP AMOUNT
    func getLowTipTotal (lowTipNum: Double, billTotal: Double){
        var total = round(billTotal*lowTipNum)/100
        lowTipAmount!.text = String(total/groupSizeValue)
        lowTipFinalTotal!.text = String((total+billTotal)/groupSizeValue)
    }
    
    func getMidTipTotal (midTipNum: Double, billTotal: Double){
        var total = round(billTotal*midTipNum)/100
        midTipAmount!.text = String(total/groupSizeValue)
        midTipFinalTotal!.text = String((total+billTotal)/groupSizeValue)
    }
    
    func getHighTipTotal (highTipNum: Double, billTotal: Double){
        var total = round(billTotal*highTipNum)/100
        highTipAmount!.text = String(total/groupSizeValue)
        highTipFinalTotal!.text = String((total+billTotal)/groupSizeValue)
    }
    
///Tip Percentage slider
    @IBAction func tipPercentageSliderChanged(sender: UISlider) {
        var sliderValue = round(Double(sender.value))
        lowTipNum = sliderValue-5
        midTipNum = sliderValue
        highTipNum = sliderValue+5
        lowTipValue!.text = String(lowTipNum)+"%"
        midTipValue!.text = String(midTipNum)+"%"
        highTipValue!.text = String(highTipNum)+"%"
        getLowTipTotal(lowTipNum, billTotal: billTotal)
        getMidTipTotal(midTipNum, billTotal: billTotal)
        getHighTipTotal(highTipNum, billTotal: billTotal)
    }
    
///Group Size Adjustment Slider
    var groupSizeValue: Double = 1.0
    @IBAction func groupSizeSliderChanged(sender: UISlider) {
        groupSizeValue = round(Double(sender.value))
        groupSizeNumber!.text = String(groupSizeValue)
        print(groupSizeValue)
        getLowTipTotal(lowTipNum, billTotal: billTotal)
        getMidTipTotal(midTipNum, billTotal: billTotal)
        getHighTipTotal(highTipNum, billTotal: billTotal)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            lowTipValue!.text = String(lowTipNum)+"%"
            midTipValue!.text = String(midTipNum)+"%"
            highTipValue!.text = String(highTipNum)+"%"
            lowTipFinalTotal!.text = "0"
            midTipFinalTotal!.text = "0"
            highTipFinalTotal!.text = "0"
            groupSizeNumber!.text = String(groupSizeValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

