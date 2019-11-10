//
//  DynamicProgramming.swift
//  DataStructures
//
//  Created by Manas Mishra on 07/11/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

extension Problems {
    func fibbonacciNumbers(till num: Int) -> Int {
        var fibonacciSeries: [Int?] = []
        for i in 0..<num {
            fibonacciSeries.append(nil)
        }
        var i = 0
        func getFibonacciSeries(_ n: Int) -> Int {
            if fibonacciSeries[n - 1] != nil {
                return fibonacciSeries[n - 1]!
            }
            if n - 1 == 0 {
                fibonacciSeries[n - 1] = 0
                return 0
            } else if n - 1 == 1 {
                fibonacciSeries[n - 1] = 1
                return 1
            }
            let sum = getFibonacciSeries(n-1) + getFibonacciSeries(n-2)
            fibonacciSeries[n - 1] = sum
            return sum
        }
        getFibonacciSeries(num)
        let s = fibonacciSeries.map { (a) -> Int in
            return a!
        }
        print(s)
        return fibonacciSeries[num-1]!
    }
    
}

extension Problems {
    //find the maximum possible coin that can be fetched
    func findMaximumCoin(a: [Int]) -> Int {
        
        var memoArr: [[Int?]] = []
        
        for i in 0..<a.count {
             var arr: [Int?] = []
            for j in 0..<a.count {
                arr.append(nil)
            }
            memoArr.append(arr)
        }
        
        func getMaximumPossibleCoin(_ s: Int, _ e: Int) -> Int {
            if let sum = memoArr[s][e] {
                return sum
            }
            if (s+1 == e) || (s == e) {
                let sum = max(a[s], a[e])
                memoArr[s][e] = sum
                return sum
            }
            guard s < e else {return 0}
            
            
            
            //if s is to be taken
            //Case1:
            let newSForCase1 = (a[s+1] > a[e]) ? s+2 : s+1
            let newEForCase1 = (a[s+1] > a[e]) ? e : e-1
            let sumForCase1 = a[s] + getMaximumPossibleCoin(newSForCase1, newEForCase1)
            
            //Case2:
            let newSForCase2 = (a[s] > a[e-1]) ? s+1 : s
            let newEForCase2 = (a[s] > a[e-1]) ? e-1 : e-2
            let sumForCase2 = a[e] + getMaximumPossibleCoin(newSForCase2, newEForCase2)
            
            let sum = max(sumForCase1, sumForCase2)
            memoArr[s][e] = sum
            
            return sum
        }
        
        let s = getMaximumPossibleCoin(0, a.count-1)
        print(s)
        return s
    }
}

extension Problems {
    //Given an array sequence [A1, A2 …An], the task is to find the maximum possible sum of increasing subsequence S of length k such that S1<=S2<=S3………<=Sk.
    func getMaximumSum(kTh: Int, arr: [Int]) -> Int {
        var sum = 0
        var sums = [[Int?]]()
        for i in 0..<arr.count {
            var a = [Int?]()
            for j in 0..<kTh {
                a.append(nil)
            }
            sums.append(a)
        }
        
        func replaceWithNewSum(newS: Int) {
            if sum < newS {
                sum = newS
            }
        }
        var j = 0
        
        func getSum(k: Int, s: Int, i: Int, p: Int?) -> Int {
            guard (i < arr.count && k > 0) else {
                if k == 0 {
                    return s
                }
                return 0
            }
            
            
            if let sum = sums[i][k-1] {
                return sum
            }
            j += 1
            print(j)
            
            let newS = getSum(k: k-1, s: s + arr[i], i: i+1, p: i)
            sums[i][k-1] = newS
            
            let newSC = getSum(k: k, s: s, i: i+1, p: p)
            //sums[i][k] = newS
            
            return max(newS, newSC)
        }
        
        print(getSum(k: kTh, s: sum, i: 0, p: nil))
        return sum
    }
}
