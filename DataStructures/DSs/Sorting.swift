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
