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

extension Problems {
    //Q: converting sorted linklist with absolute values to sorted linked list with actucal value
    // linkList -1, 2, -3, 4 t0 -3, -1, 2, 4
    
    func sortLinkListActucally(linklist: LinkedList<Int>) {
        var temp1: Node<Int>! = nil
        var prev: Node<Int>! = nil
        var temp2: Node<Int>! = linklist.head
        linklist.printList()
        
        while temp2 != nil {
            if temp1 != nil {
                if temp2 === temp1.next {
                    if !(temp2.data.isPositive) {
                        temp1 = temp2
                        prev = temp2
                        temp2 = temp2.next
                    } else {
                        prev = temp2
                        temp2 = temp2.next
                    }
                } else {
                    if !(temp2.data.isPositive) {
                        prev.next = temp2.next
                        temp2.next = temp1.next
                        temp1.next = temp2
                        
                        temp1 = temp2
                        prev = temp2
                        temp2 = temp2.next
                    } else {
                        prev = temp2
                        temp2 = temp2.next
                    }
                }
            } else {
                if !(temp2.data.isPositive) {
                    if temp2 === linklist.head {
                        temp1 = temp2
                        prev = temp2
                        temp2 = temp2.next
                    } else {
                        temp2.next = linklist.head
                        linklist.head = temp2
                        temp1 = temp2
                        prev = temp2
                        temp2 = temp2.next
                    }
                } else {
                    prev = temp2
                    temp2 = temp2.next
                }
            }
        }
        linklist.printList()
        
        if let temp1 = temp1, let index = linklist.indexOfNodeFromFirst(temp1) {
            linklist.reverseTill(fromFirst: index)
        }
        linklist.printList()
        
    }
}

extension Problems {
    //Q: input - "1ad23s", output: 24
    func numberFromString(str: String) -> Int {
        var sum = 0
        var power = 0
        
        for i in 0..<str.count {
            let index = str.count - i - 1
            if let currentNum = Int("\(str[index])") {
                sum += currentNum * 10.expo(power)
                power += 1
            } else {
                power = 0
            }
        }
        print(sum)
        return sum
    }
}
extension Problems {
    //Q: Area of the overlapping rectangles where bottomleft and top right of the rectangles are given
    struct Rectangle {
        var bottomLeft: CGPoint
        var topRight: CGPoint
    }
    func areaOfOverlappingRectangle(rec1: Rectangle, rec2: Rectangle) -> Int {
        //Overlapping Lower bottom X
        let oLLBX = max(rec1.bottomLeft.x, rec2.bottomLeft.x)
        let oLLBY = max(rec1.bottomLeft.y, rec2.bottomLeft.y)
        
        
        let oLTRX = min(rec1.topRight.x, rec2.topRight.x)
        let oLTRY = min(rec1.topRight.y, rec2.topRight.y)
        
        if oLLBX > oLTRX || oLLBY > oLLBY {
            return 0
        }
        
        let area = Int((oLTRY - oLLBY) * (oLTRX - oLLBX))
        
        return abs(area)
    }
    
}

