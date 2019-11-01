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
    
    func printList() {
        var temp = head
        while temp != nil {
            print(temp!.data ?? 0)
            temp = temp?.next
        }
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
    
    func indexOfNodeFromFirst(_ node: Node<Element>) -> Int? {
        var index = 0
        var temp = head
        while temp != nil {
            index += 1
            if temp === node {
                break
            }
            temp = temp?.next
        }
        return (index == 0) ? nil : index
        
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
    
    func reverseTill(fromFirst: Int) {
        //var temp: Node<Element>?
        func reverseTheLinkedList(_ node: Node<Element>?, prevnode: Node<Element>?, index: Int) {
            if index == fromFirst {
                var temp = head
                temp?.next = node?.next
                //head.next = temp
                head = node
                node?.next = prevnode
                return
            }
            reverseTheLinkedList(node?.next, prevnode: node, index: index + 1)
            if prevnode != nil {
                node?.next = prevnode
            }
        }
        reverseTheLinkedList(head, prevnode: nil, index: 1)
        
    }

    
    
    func reverseTheLinkedList(_ node: Node<Element>?, prevnode: Node<Element>?) {
        if node == nil {
            head = prevnode
            return
        }
        reverseTheLinkedList(node?.next, prevnode: node)
        node?.next = prevnode
    }
}
