//
//  Problems.swift
//  DataStructures
//
//  Created by Manas Mishra on 25/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit



class Problems: NSObject {

}

extension Problems {
    func calculateNoOfTimesOf(digit: Int, inBetween startNum: Int, and endNum: Int) -> Int {
        let startNumRepetionCount = getrepetionCountForNum(num: startNum, digit: digit)
        let lastNumRepetiotnCount = getrepetionCountForNum(num: endNum - 1, digit: digit)
        return lastNumRepetiotnCount - startNumRepetionCount
    }
    
    func getrepetionCountForNum(num: Int, digit: Int) -> Int {
        if num == 0, digit == 0 {
            return 1
        }
        let endNumDigits = num.allDigits
        let maximumPower = endNumDigits.count-1
        var repetitionCount = 0
        for i in 0..<maximumPower {
            if maximumPower-1 == i {
               if digit > 0 {
                    repetitionCount += ((num/10.expo(maximumPower-i))*10.expo(maximumPower-i-1))
                }
            } else {
                repetitionCount += ((num/10.expo(maximumPower-i))*10.expo(maximumPower-i-1))
            }
            if endNumDigits[i+1] > digit {
                repetitionCount += 10.expo(maximumPower-i-1)
            } else if endNumDigits[i+1] == digit {
                repetitionCount += num%10.expo(maximumPower-i-1)
                repetitionCount += 1
            }
        }
        if let first = endNumDigits.first, digit > 0 {
            if digit < first {
                repetitionCount += 10.expo(maximumPower)
            } else if digit == first {
                repetitionCount += (num - first*10.expo(maximumPower))
                repetitionCount += 1
            }
        }
        return repetitionCount
    }
}

extension Int {
    
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
