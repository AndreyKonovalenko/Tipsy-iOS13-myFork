//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zerPtcButton: UIButton!
    @IBOutlet weak var tenPtcButton: UIButton!
    @IBOutlet weak var twentyPtcButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculationLocig = CalculatinoLogic();
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tipValue = sender.currentTitle!
        switch tipValue {
        case "0%":
            zerPtcButton.isSelected = true
            tenPtcButton.isSelected = false
            twentyPtcButton.isSelected = false
        case "10%":
            tenPtcButton.isSelected = true
            zerPtcButton.isSelected = false
            twentyPtcButton.isSelected = false
        case "20%":
            twentyPtcButton.isSelected = true
            zerPtcButton.isSelected = false
            tenPtcButton.isSelected = false
        default:
            tenPtcButton.isSelected = true
            zerPtcButton.isSelected = false
            twentyPtcButton.isSelected = false
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let tip = calculationLocig.setTipValue(zero: zerPtcButton.isSelected.self, ten: tenPtcButton.isSelected.self, twenty: twentyPtcButton.isSelected.self)
        let bill = calculationLocig.setBillTotal(billValue: billTextField.text ?? "0.0")
        let splitNumber =  Int(splitNumberLabel.text!)!
        calculationLocig.calculateTips(bill: bill, tip: tip, splitNumber: splitNumber)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = calculationLocig.getSplitBill()
            destinationVC.splitNumber = calculationLocig.getSplitNumber()
            destinationVC.tipSize = calculationLocig.getTipValue()
        }
        
    }
}
