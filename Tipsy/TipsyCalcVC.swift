//
//  ViewController.swift
//  Tipsy
//
//  Created by Dominik Sadowski on 8/6/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit

class TipsyCalcVC: UIViewController {
    
    //MARK: - @IBOutlets
    
    @IBOutlet var tipsyTItleLbl: UILabel!
    @IBOutlet var tipsyTitleView: UIView!
    @IBOutlet var billAmountTF: UITextField!
    @IBOutlet var tipPercentLbl: UILabel!
    @IBOutlet var tipPercentSlider: UISlider!
    @IBOutlet var tipAmountLbl: UILabel!
    @IBOutlet var totalAmountLbl: UILabel!
    
    //MARK: - @Properties
    
    var tipCalc = TipCalc(billAmount: 0.0, tipPrercent: 0.0)
    
    //Mark: - Initialize Views

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipPercentValue()
    }
    
    //MARK: - @IBActions
    
    @IBAction func billAmountChanges(_ sender: AnyObject) {
        calcTip()
        
    }
    @IBAction func tipPercentChanges(_ sender: AnyObject) {
        calcTip()
        tipPercentValue()
    }
    
    //MARK: - Functions
    
    func calcTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billAmountTF.text)! as NSString).doubleValue
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f", tipCalc.totalAmount)
    }
    
    func tipPercentValue() {
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }

}

