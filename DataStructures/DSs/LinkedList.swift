//
//  LinkedList.swift
//  DataStructures
//
//  Created by Manas Mishra on 27/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

class Node<Element: Equatable> {
    var data: Element!
    var next: Node?
    init(_ data: Element) {
        self.data = data
    }
    
    
    //This will be used for doubly linked list
    var previous: Node?
    var random: Node?
    
    
}

class LinkedList<Element: Equatable> {
    var head: Node<Element>!
    
    init(data: Element) {
        head = Node<Element>(data)
        head.data = data
    }
    
    var count: Int {
        var i = 0
        var temp = head
        while temp != nil {
            temp = temp?.next
            i += 1
        }
        return i
    }
    
    func append(_ data: Element) {
        let node = Node(data)
        var temp = head
        while temp?.next != nil {
            temp = temp?.next
        }
        temp?.next = node
    }
    func search(_ data: Element) -> Node<Element>? {
        var temp = head
        while temp?.next != nil {
            if (temp!.data)! == data {
                return temp
            }
            temp = temp?.next
        }
        return nil
    }
    
    func delete(_ data: Element) -> Node<Element>? {
        var temp = head
        while !(temp?.next == nil || temp?.next?.data == data) {
            temp = temp?.next
        }
        let toBeDeleted = temp?.next
        temp?.next = toBeDeleted?.next
        return toBeDeleted
    }
    
    func insertAt(_ index: Int, data: Element) -> Bool {
        guard index <= count+1 else {return false}
        var temp = head
        for _ in 2..<index {
            temp = temp?.next
        }
        let newNode = Node(data)
        newNode.next = temp?.next
        temp?.next = newNode
        return true
    }
    
    func deleteAt(_ index: Int) -> Node<Element>? {
        guard index <= count else {return nil}
        var temp = head
        for _ in 2..<index {
            temp = temp?.next
        }
        let toBeDeleted = temp?.next
        temp?.next = toBeDeleted?.next
        return toBeDeleted
    }
}
