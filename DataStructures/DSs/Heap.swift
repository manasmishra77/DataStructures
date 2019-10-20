//
//  Heap.swift
//  DataStructures
//
//  Created by Manas Mishra on 19/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

// 1- Heap using array(Binary Heap)

struct Heap {
    private var items: [Int] = []
    //Change for minimum or maximum heap
    private var isMinimumHeap: Bool {
        return true
    }
    
    init(_ items: [Int]) {
        for each in items {
            self.add(each)
        }
    }
    
    
    //Getting the first element
    func peak() -> Int? {
        return items.first
    }
    
    //Deleting the first element
    mutating func poll() -> Int? {
        guard !items.isEmpty else {
            return nil
        }
        let item = items.first
        items[0] = items.last ?? 0
        heapifyDown()
        return item
    }
    
    mutating func add(_ item: Int) {
        items.append(item)
        heapifyUp(items.count - 1)
    }
}

//Heap logical operations
private extension Heap {
    mutating func heapifyDown(_ index: Int = 0) {
        if isMinimumHeap {
            var smallestItemIndex = index
            
            if hasLeftChild(index), leftChild(index) < items[smallestItemIndex] {
                smallestItemIndex = getLeftChildIndex(index)
            }
            
            if hasRightChild(index), rightChild(index) < items[smallestItemIndex] {
                smallestItemIndex = getRightChildIndex(index)
            }
            
            if smallestItemIndex != index {
                swap(indexOne: smallestItemIndex, indexTwo: index)
                heapifyDown(smallestItemIndex)
            }
        } else {
            var largestItemIndex = index
            
            if hasLeftChild(index), leftChild(index) > items[largestItemIndex] {
                largestItemIndex = getLeftChildIndex(index)
            }
            
            if hasRightChild(index), rightChild(index) > items[largestItemIndex] {
                largestItemIndex = getRightChildIndex(index)
            }
            
            if largestItemIndex != index {
                swap(indexOne: largestItemIndex, indexTwo: index)
                heapifyDown(largestItemIndex)
            }
        }
        
    }
}

//Common heap helper functions
private extension Heap {
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex+1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex+2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1)/2
    }

    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    //Return from Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    
    //Heap operation
    private mutating func swap(indexOne: Int, indexTwo: Int) {
        let placeHolder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeHolder
    }
    mutating func heapifyUp(_ index: Int) {
        if hasParent(index) {
            heapifyDown(getParentIndex(index))
            heapifyUp(getParentIndex(index))
        }
    }
}

//Building a heap from an existing array and hea
extension Heap {
    
}

