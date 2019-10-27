//
//  Queue.swift
//  DataStructures
//
//  Created by Manas Mishra on 27/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

class Queue<Element> {
    private var arr: [Element?] = []
    private let maxSize: Int!
    
    private var inIndex: Int!
    private var outIndex: Int = 0
    
    init(size: Int) {
        maxSize = size
        for _ in 0..<size {
            arr.append(nil)
        }
    }
    
    var isEmpty: Bool {
        return inIndex == nil
    }
    
    var isFull: Bool {
        return inIndex == outIndex
    }
    
    var peek: Element? {
        if isEmpty {
            return nil
        }
        return arr[outIndex]
    }
    func dequeue() -> Element? {
        if isEmpty {
            return nil
        }
        let toBeDeleted = arr[outIndex]
        arr[outIndex] = nil
        outIndex += 1
        if outIndex >= arr.count {
            outIndex = 0
        }
        if outIndex == inIndex {
            outIndex = 0
            inIndex = nil
        }
        return toBeDeleted
    }
    func enqueue(_ element: Element) -> Bool {
        if isFull {
            return false
        }
        if inIndex == nil {
            inIndex = 0
        }
        arr[inIndex] = element
        inIndex += 1
        if inIndex == arr.count {
            inIndex = 0
        }
        return true
    }
    func clear() {
        for i in 0..<arr.count {
            arr[i] = nil
        }
        outIndex = 0
        inIndex = nil
    }
}
