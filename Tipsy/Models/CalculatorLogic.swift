//
//  CalculatorLogic.swift
//  Tipsy
//
//  Created by Indradev on 19.10.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatinoLogic {
    var tips: TIPS?
    
    mutating func calculateTips(_ bill: Float, _ tip:  Float, _ splitNumber: Int )  {
        let resultValue = (bill + bill * tip) / Float(splitNumber)
        tips = TIPS(bill: bill, splitNumber: splitNumber, tip: tip, reuslt: String(format: "%.2f", resultValue))
    }
    
    func getTipValue(zero: Bool, ten: Bool, twenty: Bool) -> Float {
        var result: Float = 0.1
        if zero {
            result = 0.0
        }
        if ten {
            result = 0.1
        }
        if twenty {
            result = 0.2
        }
        return result
    }
    
    func getBillTotal(billValue: String) -> Float {
        guard let bill = Float(billValue) else { return 0.00 }
        return bill
    }
}

