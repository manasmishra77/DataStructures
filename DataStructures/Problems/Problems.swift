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



extension Problems {
    
    func isStringSubstringOf(sub: String, str: String) -> Bool {
        var j = 0
        for i in 0..<str.count where j<sub.count {
            if (str.count - i) < (sub.count - j) {
                return false
            }
            if str[i] == sub[j] {
                j += 1
            } else if j > 0 {
                j = 0
                if str[i] == sub[j] {
                    j += 1
                }
            } else {
                j = 0
            }
        }
        return j == sub.count
    }
    
    //tells between stringA and stringB, which one is lexicograhically prior
    //Using normal string iteration
    func isALexicographicallyPriorToB(_ a: String, _ b: String) -> Bool {
        var j = 0
        var i = 0
        while (i < a.count && j < b.count) {
            if a[i] > b[i] {
                return false
            }
            i += 1
            j += 1
        }
        return true
    }
}

extension Problems {
    //Q: a1 = ["ma", "ak", "ks", "jkl"], a2 = ["manas", "akash", "kddsks", "ksssaas"], return an array r which cmprises of the elements of a1 and it's elements are substring of a2
    
    func returningTheSubstringArray(a1: [String], a2: [String]) -> [String] {
        let trie = Trie()
        for i in 0..<a1.count {
            for j in 0..<a2.count {
                if isStringSubstringOf(sub: a1[i], str: a2[j]) {
                    trie.insertWordUsingLoop(word: a1[i])
                    break
                }
            }
        }
        return trie.lexicofraphicallyReturneTheArray()
    }
    
}

