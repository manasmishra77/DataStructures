//
//  Stack.swift
//  DataStructures
//
//  Created by Manas Mishra on 26/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class Stack<Element> {
    private var stackArr: [Element?] = []
    private var maxSize: Int = 0
    private var currentIndex: Int!
    
    init(size: Int) {
        maxSize = size
        for _ in 0..<size {
            stackArr.append(nil)
        }
    }
    var isStackEmpty: Bool {
        return currentIndex == nil
    }
    
    var count: Int {
        return stackArr.count
    }
    
    func push(_ element: Element) -> Bool {
        if isStackEmpty {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        if currentIndex >= maxSize {
            currentIndex -= 1
            return false
        }
        stackArr[currentIndex] = element
        return true
    }
    func pop() -> Element? {
        if isStackEmpty {
            return nil
        }
        let element = stackArr[currentIndex]
        stackArr[currentIndex] = nil
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = nil
        }
        return element
    }

}
