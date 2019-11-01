//
//  Utility.swift
//  DataStructures
//
//  Created by Manas Mishra on 30/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

extension StringProtocol {
    subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

extension Int {
    var isPositive: Bool {
        if self >= 0 {
            return true
        }
        return false
    }
    
    
    func expo(_ power: Int) -> Int {
        var result = 1
        var powerNum = power
        var tempExpo = self
        while (powerNum != 0){
            if (powerNum%2 == 1){
                result *= tempExpo
            }
            powerNum /= 2
            tempExpo *= tempExpo
        }
        return result
    }
    
    var allDigits: [Int] {
        var newNum = self
        var digits: [Int] = []
        while self >= 0 {
            let digit = newNum%10
            digits.append(digit)
            newNum = newNum/10
            if newNum < 10 {
                if self >= 10 {
                    digits.append(newNum)
                }
                break
            }
        }
        return digits.reversed()
    }
}
