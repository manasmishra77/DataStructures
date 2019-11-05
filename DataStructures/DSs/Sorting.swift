//
//  Sorting.swift
//  DataStructures
//
//  Created by Manas Mishra on 03/11/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

func mergeSortOnArray(arr: inout [Int]) {
    
    func merge(startIndex: Int, endIndex: Int) {
        let middleIndex = startIndex + (endIndex - startIndex)/2
        var sortedArr: [Int] = []
        
        var firstSortedIndex = startIndex
        var secondSortedIndex = middleIndex + 1
        
        while (firstSortedIndex <= middleIndex) && (secondSortedIndex <= endIndex) {
            if arr[firstSortedIndex] < arr[secondSortedIndex] {
                sortedArr.append(arr[firstSortedIndex])
                firstSortedIndex += 1
            } else {
                sortedArr.append(arr[secondSortedIndex])
                secondSortedIndex += 1
            }
        }
        
        while (firstSortedIndex <= middleIndex) {
            sortedArr.append(arr[firstSortedIndex])
            firstSortedIndex += 1
        }
        while (secondSortedIndex <= endIndex) {
            sortedArr.append(arr[secondSortedIndex])
            secondSortedIndex += 1
        }
        
        var i = 0
        while (i < sortedArr.count) {
            arr[startIndex + i] = sortedArr[i]
            i += 1
        }
    }
    
    func mergeSort(startIndex: Int, endIndex: Int) {
        if startIndex >= endIndex { return }
        let middleIndex = startIndex + (endIndex - startIndex)/2
        mergeSort(startIndex: startIndex, endIndex: middleIndex)
        mergeSort(startIndex: middleIndex+1, endIndex: endIndex)
        merge(startIndex: startIndex, endIndex: endIndex)
    }
    
    mergeSort(startIndex: 0, endIndex: arr.count-1)
    print(arr)
}

func mergeSortUsingLinkedList(list: LinkedList<Int>) {
   // list.printList()
    typealias NodeInt = Node<Int>
    func swap(node1: NodeInt, node2: NodeInt) {
        let temp = node1.data
        node1.data = node2.data
        node2.data = temp
    }
    
    func middlePoint(start: NodeInt, end: NodeInt) -> NodeInt? {
        if start === end {return nil}
        var temp: NodeInt? = start
        var temp2: NodeInt? = start
        
        while !(temp2 === end) {
            if (temp2?.next === end) {
                break
            }
            temp2 = temp2?.next?.next
            if (temp2 === end) {
                break
            }
            temp = temp?.next
        }
        return temp
    }
    
    func mergeList(start: NodeInt, end: NodeInt, middle: NodeInt) {
        var newList: LinkedList<Int>?
        var tempForFirstList: NodeInt? = start
        var tempForSecondList = middle.next
        
        while !(tempForFirstList === middle.next) && !(tempForSecondList === end.next) {
            if (tempForFirstList!.data < tempForSecondList!.data) {
                if newList == nil {
                    newList = LinkedList<Int>(data: tempForFirstList!.data)
                } else {
                    newList?.append(tempForFirstList!.data)
                }
                tempForFirstList = tempForFirstList?.next
            } else {
                if newList == nil {
                    newList = LinkedList<Int>(data: tempForSecondList!.data)
                } else {
                    newList?.append(tempForSecondList!.data)
                }
                tempForSecondList = tempForSecondList?.next
            }
        }
        
        if !(tempForFirstList === middle.next) {
            if newList == nil {
                newList = LinkedList<Int>(data: tempForFirstList!.data)
            } else {
                newList?.append(tempForFirstList!.data)
            }
            tempForFirstList = tempForFirstList?.next
        }
        if !(tempForSecondList === end.next) {
            if newList == nil {
                newList = LinkedList<Int>(data: tempForSecondList!.data)
            } else {
                newList?.append(tempForSecondList!.data)
            }
            tempForSecondList = tempForSecondList?.next
        }
        
        var temp = newList?.head
        tempForFirstList = start
        
        while temp != nil {
            tempForFirstList?.data = temp?.data
            temp = temp?.next
            tempForFirstList = tempForFirstList?.next
        }
    }
    
    func mergeSort(start: NodeInt?, end: NodeInt?) {
        guard let start = start, let end = end else {return}
        guard let middlePoint = middlePoint(start: start, end: end) else {return}
        mergeSort(start: start, end: middlePoint)
        mergeSort(start: middlePoint.next, end: end)
        mergeList(start: start, end: end, middle: middlePoint)
    }
    mergeSort(start: list.head, end: list.last)
    list.printList()
}

func quickSortOnArray(arr: inout [Int]) {
    
    func swap(index1: Int, index2: Int) {
        let temp = arr[index1]
        arr[index1] = arr[index2]
        arr[index2] = temp
    }
    
    func arrangeForPivotIndex(start: Int, end: Int) -> Int {
        let pivot = arr[end]
        var i = start
        var pivotIndex = end
        while i < pivotIndex {
            if arr[i] > pivot {
                pivotIndex -= 1
                swap(index1: i, index2: pivotIndex)
            } else {
                i += 1
            }
        }
        swap(index1: pivotIndex, index2: end)
        return pivotIndex
    }
    func quickSort(start: Int, end: Int) {
        guard start < end else {
            return
        }
        let pivotIndex = arrangeForPivotIndex(start: start, end: end)
        quickSort(start: start, end: pivotIndex - 1)
        quickSort(start: pivotIndex + 1, end: end)
    }
    quickSort(start: 0, end: arr.count - 1)
    print(arr)
}
