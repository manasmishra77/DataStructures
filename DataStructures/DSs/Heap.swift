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
    //Change for minimum or maximum heap
    
    private var isMinimumHeap: Bool!
    private var startIndex: Int!
    private var lastIndex: Int!
    
    init(_ items: inout [Int], isMin: Bool, startIndex: Int = 0) {
        isMinimumHeap = isMin
        self.startIndex = startIndex
        buildAHeap(from: &items)
        lastIndex = items.count-1
    }
    
    
    //Getting the first element
    func peak(from items: inout [Int]) -> Int? {
        guard startIndex < items.count else {
            return nil
        }
        return items[startIndex]
    }
    
    //Deleting the first element
    mutating func poll(from items: inout [Int]) -> Int? {
        guard startIndex < lastIndex else {
            return nil
        }
        let item = items[startIndex]
        items[startIndex] = items[lastIndex]
        heapifyDown(startIndex, to: &items)
        return item
    }
    
    mutating func add(_ item: Int, to items: inout [Int]) {
        items.append(item)
        heapifyUp(items.count - 1, from: &items)
    }
}

//Heap logical operations
private extension Heap {
    mutating func heapifyDown(_ index: Int, to items: inout [Int]) {
        if isMinimumHeap {
            var smallestItemIndex = index
            
            if hasLeftChild(index, from: &items), leftChild(index, from: &items) < items[smallestItemIndex] {
                smallestItemIndex = getLeftChildIndex(index)
            }
            
            if hasRightChild(index, from: &items), rightChild(index, from: &items) < items[smallestItemIndex] {
                smallestItemIndex = getRightChildIndex(index)
            }
            
            if smallestItemIndex != index {
                swap(indexOne: smallestItemIndex, indexTwo: index, from: &items)
                heapifyDown(smallestItemIndex, to: &items)
            }
        } else {
            var largestItemIndex = index
            
            if hasLeftChild(index, from: &items), leftChild(index, from: &items) > items[largestItemIndex] {
                largestItemIndex = getLeftChildIndex(index)
            }
            
            if hasRightChild(index, from: &items), rightChild(index, from: &items) > items[largestItemIndex] {
                largestItemIndex = getRightChildIndex(index)
            }
            
            if largestItemIndex != index {
                swap(indexOne: largestItemIndex, indexTwo: index, from: &items)
                heapifyDown(largestItemIndex, to: &items)
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

    private func hasLeftChild(_ index: Int, from items: inout [Int]) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int, from items: inout [Int]) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= startIndex
    }
    
    //Return from Heap
    private func leftChild(_ index: Int, from items: inout [Int]) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int, from items: inout [Int]) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int, from items: inout [Int]) -> Int {
        return items[getParentIndex(index)]
    }
    
    //Heap operation
    private mutating func swap(indexOne: Int, indexTwo: Int, from items: inout [Int]) {
        let placeHolder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeHolder
    }
    mutating func heapifyUp(_ index: Int, from items: inout [Int]) {
        if hasParent(index) {
            heapifyDown(getParentIndex(index), to: &items)
            heapifyUp(getParentIndex(index), from: &items)
        }
    }
}


//Building a heap from an existing array and heap
extension Heap {
    mutating func buildAHeap(from items: inout [Int]) {
        for i in (0..<items.count).reversed() {
            heapifyDown(i, to: &items)
        }
        print(items)
    }
}

//Heap sort an array
extension Heap {
    //
    mutating func heapSortTheArray(items: inout [Int]) {
        
        while startIndex < items.count-1 {
            for i in (startIndex..<items.count).reversed() {
                heapifyDown(i, to: &items)
            }
            startIndex+=1
        }
        print(items)
    }
}

