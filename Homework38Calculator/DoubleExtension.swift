//
//  DoublExtension.swift
//  Homework38Calculator
//
//  Created by 黃柏嘉 on 2021/12/10.
//

import Foundation

extension Double {
    //四捨五入
    func rounding(toDecimal decimal: Int) -> Double {
        let numOfDigits = pow(10.0, Double(decimal))
        return (self * numOfDigits).rounded(.toNearestOrAwayFromZero) / numOfDigits
    }
    //無條件捨去
    func floor(toInteger integer: Int) -> Int {
        let integer = integer - 1
        let numberOfDigits = pow(10.0, Double(integer))
        return Int((self / numberOfDigits).rounded(.towardZero) * numberOfDigits)
    }
}
